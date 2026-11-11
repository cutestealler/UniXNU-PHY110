# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-11T16:04:27Z |
| 提交 | `ba907a74d52a33d645b91bf961f4c97993b088b4` |
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
Restored 0 omitted public headers from Apple; blob hashes verified
Boot progress requires the audited UFS/owner-root and source-corecrypto build
unixnu: bash failed (1); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel.log
```
