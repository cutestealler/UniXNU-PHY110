/*
 * PHY110: display kit probes.
 *
 * This port does not ship the native legacy/mobile display kits, but bsd_init
 * and IOUserClient reference these three probes. Define them here and add this
 * file to libkern/conf/files so the kernel build links them normally.
 */
int native_legacy_display_probe(void) { return 0; }
int native_legacy_display_late_probe(void) { return 0; }
int native_mobile_display_provider_probe(void) { return 0; }
