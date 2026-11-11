# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-11T15:36:21Z |
| 提交 | `b163b638aa78a9bdc60cad60268095347a61b172` |
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
1112 warnings generated.
134 warnings generated.
     LDFILELIST bsd
             CC lastkerneldataconst.o
             CC lastkernelconstructor.o
clang: warning: no such include directory: '/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/EXPORT_HDRS/libsa' [-Wmissing-include-dirs]
clang: warning: no such include directory: '/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/EXPORT_HDRS/libsa' [-Wmissing-include-dirs]
             CC nonlto.o
clang: warning: no such include directory: '/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/EXPORT_HDRS/libsa' [-Wmissing-include-dirs]
             CC version.o
clang: warning: no such include directory: '/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/EXPORT_HDRS/libsa' [-Wmissing-include-dirs]
             LD mach.development.bcm2837.unstripped.noctf
ld: warning: directory not found for option '-L/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/platform'
ld: warning: directory not found for option '-L/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/platform'
Undefined symbols for architecture arm64:
  "_native_legacy_display_late_probe", referenced from:
      _bsd_init in bsd_init.o
      _bsd_autoconf in bsd_init.o
  "_native_legacy_display_probe", referenced from:
      _bsd_init in bsd_init.o
      _native_mobile_graphics_client_probe in IOUserClient.cpo
  "_native_mobile_display_provider_probe", referenced from:
      _native_mobile_graphics_client_probe in IOUserClient.cpo
ld: symbol(s) not found for architecture arm64
clang++: error: linker command failed with exit code 1 (use -v to see invocation)
make[3]: *** [/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/DEVELOPMENT_ARM64_BCM2837//mach.development.bcm2837.unstripped.noctf] Error 1
make[2]: *** [build_all] Error 2
make[1]: *** [build_all_bootstrap_DEVELOPMENT^ARM64^BCM2837] Error 2
make: *** [build] Error 2
build-xnu-4k-baseline.sh: line 845: make -C .cache/xnu-work "${XNU_BUILD_TARGET:-build}" SDKROOT="${XNU_SDKROOT:-iphoneos}" ARCH_CONFIGS=ARM64 MACHINE_CONFIGS=${XNU_MACHINE_CONFIG:-BCM2837} KERNEL_CONFIGS=${XNU_KERNEL_CONFIG:-DEVELOPMENT} ARCH_STRING_FOR_CURRENT_MACHINE_CONFIG="$XNU_ARCH_STRING" LARGE_MEMORY_DEFINE=-UARM_LARGE_MEMORY ARM64_LINK_ADDR=0xfffffff007004000 ARM64_PLKSEG_ADDR=0xfffffff004004000 DEPLOYMENT_TARGET_FLAGS="-miphoneos-version-min=$IOS_VERSION $XNU_TARGET_DEFINE" DEPLOYMENT_LINKER_FLAGS="-Wl,-ios_version_min,$IOS_VERSION" RC_DARWIN_KERNEL_VERSION="$XNU_DARWIN" RC_ProjectSourceVersion="$XNU_VERSION" BUILD_LTO=0 BOUND_CHECKS=0 BUILD_WERROR="${XNU_BUILD_WERROR:-0}" MAKEJOBS=-j"${JOBS:-4}" CFLAGS_EXTRA="$EXTRA_CFLAGS" "${EXTRA_MAKE_ARGS[@]}" ${XNU_HOST_MAKE_ARGS[@]+"${XNU_HOST_MAKE_ARGS[@]}"} OBJROOT="$ROOT/build/xnu/ios-obj" SYMROOT="$ROOT/build/xnu/ios-sym" DSTROOT="$ROOT/build/xnu/ios-dst" failed
== kernel: prepare storage headers
+ python3 /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/prepare-storage-headers.py
+ bash /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/build-xnu-4k-baseline.sh
PHY120: seeded 3 cached listings into .cache/sources
PHY120: dropped -mach_msg2 from MIGKSFLAGS
Restored 0 omitted public headers from Apple; blob hashes verified
Boot progress requires the audited UFS/owner-root and source-corecrypto build
unixnu: bash failed (1); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel.log
```
