/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "android.hardware.power@1.0-service.mocha"

#include <android/log.h>
#include <cutils/properties.h>
#include <fstream>
#include <string>
#include <utils/Log.h>
#include "Power.h"
#include "sysfs.h"

namespace android {
namespace hardware {
namespace power {
namespace V1_0 {
namespace implementation {

using ::android::hardware::power::V1_0::Feature;
using ::android::hardware::power::V1_0::PowerHint;
using ::android::hardware::power::V1_0::PowerStatePlatformSleepState;
using ::android::hardware::power::V1_0::Status;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;

static const std::string TAP_TO_WAKE_NODE = "/proc/touchpanel/double_tap_enable";
static const std::string POWER_PROFILE_PROPERTY = "sys.perf.profile";
static const int PROFILE_MAX = 4;

Power::Power() {
    ALOGI("power_init\n");
}

// Methods from ::android::hardware::power::V1_0::IPower follow.
Return<void> Power::setInteractive(bool /*interactive*/)  {
    ALOGI("power_set_interactive\n");
    return Void();
}

Return<void> Power::powerHint(PowerHint hint, int32_t data) {
    if (static_cast<power_hint_t>(hint) == POWER_HINT_SET_PROFILE) {
        std::string value = std::to_string(data);
        property_set(POWER_PROFILE_PROPERTY.c_str(), value.c_str());
        ALOGI("set power profile = %d", data);
    }
    return Void();
}

Return<void> Power::setFeature(Feature feature, bool activate)  {
    if (feature == Feature::POWER_FEATURE_DOUBLE_TAP_TO_WAKE) {
        ALOGI("POWER_FEATURE_DOUBLE_TAP_TO_WAKE activate = %d\n", activate);
        std::string data = std::to_string(activate);
        utils::sysfs_write(TAP_TO_WAKE_NODE, data);
    }
    return Void();
}

Return<void> Power::getPlatformLowPowerStats(getPlatformLowPowerStats_cb _hidl_cb) {
    hidl_vec<PowerStatePlatformSleepState> states;
    states.resize(0);
    _hidl_cb(states, Status::SUCCESS);
    return Void();
}

Return<int32_t> Power::getFeature(LineageFeature feature)  {
    if (feature == LineageFeature::SUPPORTED_PROFILES) {
        ALOGI("power profiles POWER_FEATURE_SUPPORTED_PROFILES\n");
        return PROFILE_MAX;
    }
    return -1;
}

status_t Power::registerAsSystemService() {
    status_t ret = 0;

    ret = IPower::registerAsService();
    if (ret != 0) {
        ALOGE("Failed to register IPower (%d)", ret);
        goto fail;
    } else {
        ALOGI("Successfully registered IPower");
    }

    ret = ILineagePower::registerAsService();
    if (ret != 0) {
        ALOGE("Failed to register ILineagePower (%d)", ret);
        goto fail;
    } else {
        ALOGI("Successfully registered ILineagePower");
    }

fail:
    return ret;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace power
}  // namespace hardware
}  // namespace android
