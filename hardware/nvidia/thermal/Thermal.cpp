/*
 * Copyright (C) 2017 The Android Open Source Project
 * Copyright (C) 2017-2018 The LineageOS Project
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

#define LOG_TAG "android.hardware.thermal@1.0-service-nvidia"

// #define LOG_NDEBUG 0

#include <android/log.h>
#include <utils/Log.h>
#include "Thermal.h"
#include "thermalhal.h"

namespace android {
namespace hardware {
namespace thermal {
namespace V1_0 {
namespace implementation {

Thermal::Thermal() {
  pd_count = thermal_init();
}

// Methods from ::android::hardware::thermal::V1_0::IThermal follow.
Return<void> Thermal::getTemperatures(getTemperatures_cb _hidl_cb) {
  ThermalStatus status;
  status.code = ThermalStatusCode::SUCCESS;
  hidl_vec<Temperature> temperatures;

  temperatures.resize(pd_count);
  int size = get_temperatures(reinterpret_cast<temperature_t*>(&temperatures[0]), pd_count);
  if (size < 0) {
    status.code = ThermalStatusCode::FAILURE;
    status.debugMessage = strerror(-size);
  }
  else
    temperatures.resize(size);

  _hidl_cb(status, temperatures);
  return Void();
}

Return<void> Thermal::getCpuUsages(getCpuUsages_cb _hidl_cb) {
  ThermalStatus status;
  status.code = ThermalStatusCode::SUCCESS;
  hidl_vec<CpuUsage> cpuUsages;

  cpuUsages.resize(pd_count);
  int size = get_cpu_usages(reinterpret_cast<cpu_usage_t*>(&cpuUsages[0]));
  if (size < 0) {
    status.code = ThermalStatusCode::FAILURE;
    status.debugMessage = strerror(-size);
  }
  else
    cpuUsages.resize(size);

  _hidl_cb(status, cpuUsages);
  return Void();
}

Return<void> Thermal::getCoolingDevices(getCoolingDevices_cb _hidl_cb) {
  ThermalStatus status;
  status.code = ThermalStatusCode::SUCCESS;
  hidl_vec<CoolingDevice> coolingDevices;

  coolingDevices.resize(pd_count);
  int size = get_cooling_devices(reinterpret_cast<cooling_device_t*>(&coolingDevices[0]), pd_count);
  if (size < 0) {
    status.code = ThermalStatusCode::FAILURE;
    status.debugMessage = strerror(-size);
  }
  else
    coolingDevices.resize(size);

  _hidl_cb(status, coolingDevices);
  return Void();
}

status_t Thermal::registerAsSystemService() {
    status_t ret = 0;

    ret = IThermal::registerAsService();
    if (ret != 0) {
        ALOGE("Failed to register IThermal (%d)", ret);
        goto fail;
    } else {
        ALOGI("Successfully registered IThermal");
    }

fail:
    return ret;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace thermal
}  // namespace hardware
}  // namespace android
