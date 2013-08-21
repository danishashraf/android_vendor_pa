# Copyright (C) 2012 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_jfltecsp,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk
# inherit from common jf
-include device/samsung/jf-common/BoardConfigCommon.mk
# inherit from the proprietary version
-include vendor/samsung/jfltecsp/BoardConfigVendor.mk

# Inherit from jfltecsp device
$(call inherit-product, device/samsung/jfltecsp/full_jfltecsp.mk)
# Inherit some common CM stuff.
$(call inherit-product, vendor/pa/config/cdma.mk)

# Include CM extras
EXTRA_CM_PACKAGES ?= true

# Override AOSP build properties
PRODUCT_NAME := pa_jfltecsp
PRODUCT_DEVICE := jfltecsp
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SCH-R970X
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltecsp TARGET_DEVICE=jfltecsp BUILD_FINGERPRINT="samsung/jfltecsp/jfltecsp:4.2.2/JDQ39/R970XWWUAMFA:user/release-keys" PRIVATE_BUILD_DESC="jfltecsp-user 4.2.2 JDQ39 R970XWWUAMFA release-keys"

# Include ParanoidAndroid repos configuration
include vendor/pa/config/pa_addons.mk

endif
