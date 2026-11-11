#!/bin/bash
# Applied to the prepared XNU work tree by build-xnu-4k-baseline.sh, right before
# UniXNU's source prepare step.
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SELF=$(cd "$(dirname "$0")" && pwd)

# 1. Seed the Apple directory listings so prepare-xnu-source.py never needs the
#    network. On a shared runner IP its unauthenticated API calls hit the anonymous
#    rate limit and abort the build before it starts.
SEED_DIR="$SELF/phy120-xnu-cache"
if [ -d "$SEED_DIR" ]; then
  mkdir -p "$ROOT/.cache/sources"
  cp "$SEED_DIR"/*.json "$ROOT/.cache/sources/"
  echo "PHY120: seeded $(ls -1 "$SEED_DIR" | wc -l | tr -d ' ') cached listings into .cache/sources"
fi

# 2. Drop the DriverKit iig translation units. They are generated from Apple's
#    internal interface definitions, use IORPCMessageFromMach and ask clang for
#    -mach_msg2. iokit/conf/files marks them "optional iokitcpp", so removing the
#    entries takes them out of the build. DriverKit is user-space driver support and
#    is not used by anything this port boots.
# PHY110-DISABLED CONF="$ROOT/.cache/xnu-work/iokit/conf/files"
# PHY110-DISABLED if [ -f "$CONF" ]; then
# PHY110-DISABLED   before=$(wc -l < "$CONF")
# PHY110-DISABLED   grep -v -E 'DriverKit/[A-Za-z0-9_]+\.iig\.cpp' "$CONF" > "$CONF.new" || true
# PHY110-DISABLED   mv "$CONF.new" "$CONF"
# PHY110-DISABLED   echo "PHY120: iokit/conf/files $before -> $(wc -l < "$CONF") lines (DriverKit iig dropped)"
# PHY110-DISABLED fi


# 3. MIGKSFLAGS asks for -mach_msg2, which this Xcode's mig forwards to clang,
#    which rejects it; mig then aborts with "no SubSystem declaration".
MAKEDEF="$ROOT/.cache/xnu-work/makedefs/MakeInc.def"
if [ -f "$MAKEDEF" ] && grep -q -- '-mach_msg2' "$MAKEDEF"; then
  sed -i '' 's/^\([[:space:]]*\)-mach_msg2[[:space:]]*$/\1# PHY120: -mach_msg2 dropped, unsupported by this mig/' "$MAKEDEF"
  echo "PHY120: dropped -mach_msg2 from MIGKSFLAGS"
fi

# 4. Provide the three display probes as a real kernel source file.
#    build-xnu-4k-baseline.sh links native-legacy-display / native-mobile-display
#    archives that this port does not ship, so bsd_init.c and IOUserClient.cpo
#    reference probes nobody defines. Adding them to libkern makes the build
#    compile and link them the ordinary way.
STUB="$ROOT/.cache/xnu-work/libkern/native_display_stubs.c"
CONF="$ROOT/.cache/xnu-work/libkern/conf/files"
if [ -d "$ROOT/.cache/xnu-work/libkern" ]; then
  cat > "$STUB" <<'STUBEOF'
/*
 * PHY110: display kit probes.
 * The port does not ship the native legacy/mobile display kits, but bsd_init
 * and IOUserClient reference these three probes. Return 0 so the callers take
 * the "no kit" path.
 */
int native_legacy_display_probe(void) { return 0; }
int native_legacy_display_late_probe(void) { return 0; }
int native_mobile_display_provider_probe(void) { return 0; }
STUBEOF
  if [ -f "$CONF" ] && ! grep -q "native_display_stubs" "$CONF"; then
    printf 'libkern/native_display_stubs.c\t\tstandard\n' >> "$CONF"
    echo "PHY110: native_display_stubs.c added to libkern/conf/files"
  fi
else
  echo "PHY110: libkern dir missing, cannot add display stubs"
fi
