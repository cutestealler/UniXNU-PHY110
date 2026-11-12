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

# 4. Display kit probes. Runs during the build (after xnu is unpacked), so the
#    kernel tree exists here. Definitions go into libkern and are registered in
#    libkern/conf/files.
echo "PHY110 stub: enter"
KROOT="$ROOT/.cache/xnu-work"
if [ -d "$KROOT/libkern" ]; then
  echo "PHY110 stub: libkern present"
  cat > "$KROOT/libkern/native_display_stubs.c" <<'STUBEOF'
/* PHY110: display kit probes (port ships no display kit). */
int native_legacy_display_probe(void) { return 0; }
int native_legacy_display_late_probe(void) { return 0; }
int native_mobile_display_provider_probe(void) { return 0; }
STUBEOF
  if ! grep -q native_display_stubs "$KROOT/libkern/conf/files" 2>/dev/null; then
    printf 'libkern/native_display_stubs.c\t\tstandard\n' >> "$KROOT/libkern/conf/files"
    echo "PHY110 stub: registered in libkern/conf/files"
  else
    echo "PHY110 stub: already registered"
  fi
else
  echo "PHY110 stub: libkern missing (KROOT=$KROOT)"
fi
