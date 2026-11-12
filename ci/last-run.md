# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-12T05:54:50Z |
| 提交 | `ecbd78b859ed4279db0cd96a1d78efde6a4794e7` |
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
fatal: destination path '.cache/xnu-work' already exists and is not an empty directory.
build-xnu-4k-baseline.sh: line 36: git clone --shared refer/xnu .cache/xnu-work failed
unixnu: bash failed (128); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel-bootstrap.log
```
