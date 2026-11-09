# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-09T06:51:00Z |
| 提交 | `7ee2f7acaab4327b14d0a2d654ce1454b8d22791` |
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
  "IOService::Start(IOService*, int (*)(OSMetaClassBase*, IORPC))", referenced from:
      IOUserService::start(IOService*) in IOUserServer.cpo
  "IOService::Dispatch(IORPC)", referenced from:
      vtable for IOService in IOService.cpo
      vtable for IOResources in IOService.cpo
      vtable for IOUserResources in IOService.cpo
      vtable for IOExclaveProxy in IOService.cpo
      vtable for _IOServiceStateNotification in IOService.cpo
      vtable for IOServiceCompatibility in IOService.cpo
      vtable for IOPMPowerSource in IOPMPowerSource.cpo
      ...
  "IOService::MetaClass::Dispatch(IORPC)", referenced from:
      vtable for IOService::MetaClass in IOService.cpo
  "vtable for IODispatchSource", referenced from:
      IODataQueueDispatchSource::init() in IOUserServer.cpo
      IODataQueueDispatchSource::free() in IOUserServer.cpo
      IOInterruptDispatchSource::init() in IOUserServer.cpo
      IOInterruptDispatchSource::free() in IOUserServer.cpo
      IOServiceNotificationDispatchSource::init() in IOUserServer.cpo
      IOServiceNotificationDispatchSource::free() in IOUserServer.cpo
      IOServiceStateNotificationDispatchSource::init() in IOUserServer.cpo
      ...
  NOTE: a missing vtable usually means the first non-inline virtual member function has no definition.
ld: symbol(s) not found for architecture arm64
clang++: error: linker command failed with exit code 1 (use -v to see invocation)
make[3]: *** [/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/xnu/ios-obj/DEVELOPMENT_ARM64_BCM2837//mach.development.bcm2837.unstripped.noctf] Error 1
make[2]: *** [build_all] Error 2
make[1]: *** [build_all_bootstrap_DEVELOPMENT^ARM64^BCM2837] Error 2
make: *** [build] Error 2
build-xnu-4k-baseline.sh: line 830: make -C .cache/xnu-work "${XNU_BUILD_TARGET:-build}" SDKROOT="${XNU_SDKROOT:-iphoneos}" ARCH_CONFIGS=ARM64 MACHINE_CONFIGS=${XNU_MACHINE_CONFIG:-BCM2837} KERNEL_CONFIGS=${XNU_KERNEL_CONFIG:-DEVELOPMENT} ARCH_STRING_FOR_CURRENT_MACHINE_CONFIG="$XNU_ARCH_STRING" LARGE_MEMORY_DEFINE=-UARM_LARGE_MEMORY ARM64_LINK_ADDR=0xfffffff007004000 ARM64_PLKSEG_ADDR=0xfffffff004004000 DEPLOYMENT_TARGET_FLAGS="-miphoneos-version-min=$IOS_VERSION -DXNU_TARGET_OS_IOS" DEPLOYMENT_LINKER_FLAGS="-Wl,-ios_version_min,$IOS_VERSION" RC_DARWIN_KERNEL_VERSION="$XNU_DARWIN" RC_ProjectSourceVersion="$XNU_VERSION" BUILD_LTO=0 BOUND_CHECKS=0 BUILD_WERROR="${XNU_BUILD_WERROR:-0}" MAKEJOBS=-j"${JOBS:-4}" CFLAGS_EXTRA="$EXTRA_CFLAGS" "${EXTRA_MAKE_ARGS[@]}" ${XNU_HOST_MAKE_ARGS[@]+"${XNU_HOST_MAKE_ARGS[@]}"} OBJROOT="$ROOT/build/xnu/ios-obj" SYMROOT="$ROOT/build/xnu/ios-sym" DSTROOT="$ROOT/build/xnu/ios-dst" failed
== kernel: prepare storage headers
+ python3 /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/prepare-storage-headers.py
+ bash /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/scripts/build-xnu-4k-baseline.sh
PHY110: seeded 3 cached listings into .cache/sources
PHY110: DriverKit lines left: 0
PHY110: iokit/conf/files      138 ->      138 lines (DriverKit iig dropped)
PHY110: dropped -mach_msg2 from MIGKSFLAGS
Restored 0 omitted public headers from Apple; blob hashes verified
build-xnu-4k-baseline.sh: line 782: test -f "$CRYPTO_ARCHIVE" failed
unixnu: bash failed (1); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel.log
```
