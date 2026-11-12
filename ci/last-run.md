# 最近一次内核构建

| 项 | 值 |
| --- | --- |
| 时间 | 2026-11-12T08:25:14Z |
| 提交 | `cff4f93e80fb39d17c78e84fe91c68e928d4c0a5` |
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
    /bin/ln -sfh ../../../../.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/sym/Release-iphoneos/liblibfirehose_kernel.a

Unifdef /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/include/kernel/os/firehose_buffer_private.h /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work/os/firehose_buffer_private.h (in target 'libfirehose_kernel' from project 'libdispatch')
    cd /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work
    /Applications/Xcode_16.4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/unifdef -x 2 -DKERNEL\=1 -DOS_FIREHOSE_SPI\=1 -DOS_VOUCHER_ACTIVITY_SPI_TYPES\=1 -UOS_VOUCHER_ACTIVITY_SPI -o /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/include/kernel/os/firehose_buffer_private.h /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work/os/firehose_buffer_private.h

CompileC /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/firehose_buffer.o /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work/src/firehose/firehose_buffer.c normal arm64 c com.apple.compilers.llvm.clang.1_0.compiler (in target 'libfirehose_kernel' from project 'libdispatch')
    cd /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work
    
    Using response file: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/7187679823f38a2a940e0043cdf9d637-common-args.resp
    
    /Applications/Xcode_16.4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -x c -ivfsstatcache /var/folders/20/jp1_0n3n7kndh6rnbqb5344m0000gn/C/com.apple.DeveloperTools/16.4-16F6/Xcode/SDKStatCaches.noindex/iphoneos18.5-22F76-a529daf784b3616c7c04a36aeb7f5c05.sdkstatcache -fmessage-length\=0 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit\=0 -fno-color-diagnostics -Wno-trigraphs -Wno-missing-field-initializers -Wno-missing-prototypes -Wno-return-type -Wno-missing-braces -Wparentheses -Wswitch -Wno-unused-function -Wno-unused-label -Wno-unused-parameter -Wno-unused-variable -Wunused-value -Wno-empty-body -Wno-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wno-constant-conversion -Wno-int-conversion -Wno-bool-conversion -Wno-enum-conversion -Wno-float-conversion -Wno-non-literal-null-conversion -Wno-objc-literal-conversion -Wshorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-implicit-fallthrough -fstrict-aliasing -Wdeprecated-declarations -Wno-sign-conversion -Wno-infinite-recursion -Wno-comma -Wno-block-capture-autoreleasing -Wno-strict-prototypes -Wno-semicolon-before-method-body -Wno-packed @/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/7187679823f38a2a940e0043cdf9d637-common-args.resp -MMD -MT dependencies -MF /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/firehose_buffer.d --serialize-diagnostics /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/firehose_buffer.dia -c /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work/src/firehose/firehose_buffer.c -o /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/firehose_buffer.o

Libtool /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a normal (in target 'libfirehose_kernel' from project 'libdispatch')
    cd /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work
    /Applications/Xcode_16.4.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool -static -arch_only arm64 -D -syslibroot /Applications/Xcode_16.4.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.5.sdk -L/Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/sym/Release-iphoneos -filelist /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/libfirehose_kernel.LinkFileList -dependency_info /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/build/firehose/obj/libdispatch.build/Release-iphoneos/libfirehose_kernel.build/Objects-normal/arm64/libfirehose_kernel_libtool_dependency_info.dat -o /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a

SetOwnerAndGroup runner:staff /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a (in target 'libfirehose_kernel' from project 'libdispatch')
    cd /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work
    /usr/sbin/chown -RH runner:staff /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a

SetMode u+w,go-w,a+rX /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a (in target 'libfirehose_kernel' from project 'libdispatch')
    cd /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/libdispatch-work
    /bin/chmod -RH u+w,go-w,a+rX /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/tree/.cache/fakeroot/usr/local/lib/kernel/liblibfirehose_kernel.a

warning: Traditional headermap style is no longer supported; please migrate to using separate headermaps and set 'ALWAYS_SEARCH_USER_PATHS' to NO. (in target 'libfirehose_kernel' from project 'libdispatch')
** INSTALL SUCCEEDED **

Non-fat file: .cache/fakeroot/usr/local/lib/kernel/libfirehose_kernel.a is architecture: arm64
ArmCpu bring-up requires the real source provider and a real platform driver
unixnu: bash failed (1); full log: /Users/runner/work/UniXNU-PHY110/UniXNU-PHY110/UniXNU/out/PHY110/logs/kernel-bootstrap.log
```
