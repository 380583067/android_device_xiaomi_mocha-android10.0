/*
   Copyright (C) 2018 Artyom Bambalov <artem-bambalov@yandex.ru>
 */

#define LOG_TAG "mocha_init"

#include <android-base/properties.h>
#include <android-base/logging.h>
#include <sys/sysinfo.h>

#include "property_service.h"

char const* heapstartsize;
char const* heapgrowthlimit;
char const* heapsize;
char const* heapminfree;

void get_dalvik_heap_props()
{
    struct sysinfo sys;

    sysinfo(&sys);

    if (sys.totalram > 2048ull * 1024 * 1024) {
        LOG(VERBOSE) << "3Gb RAM device";
        heapstartsize = "8m";
        heapgrowthlimit = "288m";
        heapsize = "768m";
        heapminfree = "512k";
    } else {
        LOG(VERBOSE) << "2Gb RAM device";
        heapstartsize = "16m";
        heapgrowthlimit = "192m";
        heapsize = "512m";
        heapminfree = "2m";
    }
}

void vendor_load_properties()
{
    get_dalvik_heap_props();

    android::init::property_set("dalvik.vm.heapstartsize", heapstartsize);
    android::init::property_set("dalvik.vm.heapgrowthlimit", heapgrowthlimit);
    android::init::property_set("dalvik.vm.heapsize", heapsize);
    android::init::property_set("dalvik.vm.heaptargetutilization", "0.75");
    android::init::property_set("dalvik.vm.heapminfree", heapminfree);
    android::init::property_set("dalvik.vm.heapmaxfree", "8m");
}
