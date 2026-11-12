# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-12T06:37:29Z |
| 提交 | `2ccf760f1352cc8b20f88f86d1fdc4f67dc986ee` |
| 触发 | push |
| 作业状态 | failure |

## 产物

```
(没有 kernel 输出)
```

## kernel.log 末尾 150 行

```
== submodules /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU
== tree /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree
== kernel: XNU
== kernel: bootstrap pass for the compile records
+ bash /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/build-xnu-4k-baseline.sh
== kernel: prepare storage headers
+ python3 /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/prepare-storage-headers.py
+ bash /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/build-xnu-4k-baseline.sh
PHY120: seeded 3 cached listings into .cache/sources
PHY120: dropped -mach_msg2 from MIGKSFLAGS
PHY110 stub: enter
PHY110 stub: libkern present
PHY110 stub: already registered
Restored 0 omitted public headers from Apple; blob hashes verified
build-xnu-4k-baseline.sh: line 797: test -f "$CRYPTO_ARCHIVE" failed
unixnu: bash failed (1); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel.log
```
