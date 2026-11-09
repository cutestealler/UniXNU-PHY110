#!/bin/bash
# One-shot build for the PHY110 (OPPO Find X7 Ultra, SM8650) UniXNU port.
#
#   ./setup.sh /path/to/IMAGES/uefi.elf
#
# 1) clone the base firmware tree (UniXNU/uefi-sheng, branch sheng), or reuse a local copy
# 2) drop this port's platform package + config + device tree into it
# 3) import the device's own DXE drivers out of the stock uefi.elf
# 4) build the firmware
# 5) pack boot.img and vendor_boot.img from the stock images next to uefi.elf
#
# NOTE: paths below follow the CURRENT repo layout (uefi/Platforms/..., uefi/Resources/...).
#       The original PHY120 script used a stale "platform/" prefix that does not exist.
set -eu

STOCK_ELF="${1:-}"
PORT=$(cd "$(dirname "$0")" && pwd)
WORK="${WORK:-$PWD/phy110-build}"

if [ -z "$STOCK_ELF" ]; then
  echo "usage: $0 <path to IMAGES/uefi.elf from the PHY110 firmware package>" >&2
  exit 2
fi
[ -f "$STOCK_ELF" ] || { echo "not found: $STOCK_ELF" >&2; exit 2; }
STOCK_DIR=$(cd "$(dirname "$STOCK_ELF")" && pwd)
echo "stock dir : $STOCK_DIR"
echo "port      : $PORT"
echo "work      : $WORK"

echo "== 1/5 base firmware tree =="
mkdir -p "$WORK"
cd "$WORK"
if [ ! -d uefi ]; then
  if [ -d "$HOME/src/uefi-sheng/.git" ]; then
    echo "   reusing $HOME/src/uefi-sheng"
    cp -a "$HOME/src/uefi-sheng" uefi
  else
    git clone --depth 1 -q -b sheng https://github.com/UniXNU/uefi-sheng.git uefi
  fi
fi
cd uefi

echo "== 2/5 platform package + config + dtb =="
mkdir -p Platforms/OPPO Resources/Configs Resources/DTBs
rm -rf Platforms/OPPO/PHY110Pkg
cp -a "$PORT/uefi/Platforms/OPPO/PHY110Pkg" Platforms/OPPO/
cp "$PORT/uefi/Resources/Configs/PHY110.toml" Resources/Configs/PHY110.toml
cp "$PORT/uefi/Resources/DTBs/lanai-oppo-phy110.dtb" Resources/DTBs/
mkdir -p Platforms/OPPO/PHY110Pkg/FdtBlob
cp "$PORT/uefi/Resources/DTBs/lanai-oppo-phy110.dtb" \
   Platforms/OPPO/PHY110Pkg/FdtBlob/lanai-oppo-phy110.dtb

echo "== 3/5 import the device's own DXE drivers =="
python3 "$PORT/tools/import_binaries.py" --tree . --stock-elf "$STOCK_ELF"

echo "== 4/5 build firmware =="
python3 build_uefi.py -d PHY110 -r DEBUG

echo "== 5/5 pack images =="
PORT_WORK="$PWD" STOCK_BOOT="$STOCK_DIR/boot.img" \
  python3 "$PORT/tools/pack_boot.py"
PORT_WORK="$PWD" STOCK_VENDOR_BOOT="$STOCK_DIR/vendor_boot.img" \
  python3 "$PORT/tools/mk_vendor_boot2.py" \
  || echo "   (vendor_boot packing skipped: needs vendor_boot.img next to uefi.elf)"

cat <<EOF

Done.
  firmware volume : $WORK/uefi/Build/PHY110Pkg/DEBUG_CLANGPDB/FV/SILICIUM_UEFI.fd
  boot image      : $WORK/uefi/out/boot-PHY110.img
  vendor_boot     : $WORK/uefi/out/vendor_boot-PHY110.img

Flash with EDL (fastboot is disabled on OPPO Find X7 Ultra):
  fastboot/EDL geometry must be read from the PHY110 GPT first --
  the PHY120 numbers in the docs (LUN 4, 121734 / 315974) do NOT apply.
EOF
