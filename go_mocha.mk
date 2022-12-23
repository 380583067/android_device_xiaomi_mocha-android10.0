#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sets Android Go default values for properties specific

# Set lowram options and enable traced by default
PRODUCT_PROPERTY_OVERRIDES += \
     ro.config.low_ram=true \
     persist.traced.enable=1


# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Default heap sizes. Allow up to 256m for large heaps to make sure a single app
# doesn't take all of the RAM.
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=128m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=360m


# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Set lowram options
PRODUCT_PROPERTY_OVERRIDES += \
     ro.lmk.critical_upgrade=true \
     ro.lmk.upgrade_pressure=40 \
     ro.lmk.downgrade_pressure=60 \
     ro.lmk.kill_heaviest_task=false \
     ro.statsd.enable=true

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
     pm.dexopt.downgrade_after_inactive_days=10

# Default heap sizes. Allow up to 256m for large heaps to make sure a single app
# doesn't take all of the RAM.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=128m
    dalvik.vm.heapsize=256m

# 512MB specific properties.

# lmkd can kill more now.
PRODUCT_PROPERTY_OVERRIDES += \
     ro.lmk.medium=700

# madvise random in ART to reduce page cache thrashing.
PRODUCT_PROPERTY_OVERRIDES += \
     dalvik.vm.madvise-random=true
