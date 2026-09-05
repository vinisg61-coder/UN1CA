#
# Copyright (C) 2023 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Debloat list for Galaxy A52s 5G (a52sxq)
# - Add entries inside the specific partition containing that file (<PARTITION>_DEBLOAT+="")
# - DO NOT add the partition name at the start of any entry (eg. "/system/dpolicy_system")
# - DO NOT add a slash at the start of any entry (eg. "/dpolicy_system")

# Overlays
SYSTEM_DEBLOAT+="
system/app/WifiRROverlayAppQC
system/app/WifiRROverlayAppWifiLock
"
PRODUCT_DEBLOAT+="
overlay/SoftapOverlay6GHz
overlay/SoftapOverlayDualAp
overlay/SoftapOverlayOWE
"

# mAFPC
SYSTEM_DEBLOAT+="
system/bin/mafpc_write
"

# HDCP
SYSTEM_DEBLOAT+="
system/bin/dhkprov
system/bin/qchdcpkprov
system/etc/init/dhkprov.rc
system/lib64/vendor.samsung.hardware.security.hdcp.keyprovisioning@1.0.so
"

# GameDriver for a different Snapdragon platform
SYSTEM_DEBLOAT+="
system/priv-app/GameDriver-SM8550
"

# Optional Samsung services not required for telephony, camera, biometrics, NFC or AOD.
# Keep this list limited to opt-in apps so core Samsung functionality remains intact.
SYSTEM_DEBLOAT+="
system/hidden/SmartTutor
system/priv-app/GameHome
system/priv-app/OneDrive_Samsung_v3
system/priv-app/SamsungCarKeyFw
system/priv-app/Upday
"

# Extreme A52s profile: remove additional user-facing Samsung, diagnostics,
# factory, OTA, payment and language components. This intentionally removes
# Samsung Pass/Wallet/OTA support; restore entries here if those features are
# required. Radio, camera, biometric, NFC, Wi-Fi/Bluetooth and thermal blobs
# are deliberately not included.
SYSTEM_DEBLOAT+="
system/app/DRParser
system/app/FactoryAirCommandManager
system/app/FactoryCameraFB
system/app/FBAppManager_NS
system/app/PlayAutoInstallConfig
system/app/SamsungCalendar
system/app/SamsungPassAutofill_v1
system/app/SilentLog
system/app/SmartReminder
system/app/WebManual
system/app/WlanTest
system/etc/init/samsung_pass_authenticator_service.rc
system/etc/permissions/privapp-permissions-com.samsung.android.app.kfa.xml
system/etc/permissions/privapp-permissions-com.samsung.android.authfw.xml
system/etc/permissions/privapp-permissions-com.samsung.android.cidmanager.xml
system/etc/permissions/privapp-permissions-com.samsung.android.samsungpass.xml
system/etc/permissions/privapp-permissions-com.samsung.android.spayfw.xml
system/etc/permissions/privapp-permissions-com.sec.android.diagmonagent.xml
system/etc/permissions/privapp-permissions-com.sec.android.soagent.xml
system/etc/permissions/privapp-permissions-com.sec.bcservice.xml
system/etc/permissions/privapp-permissions-com.sem.factoryapp.xml
system/etc/permissions/privapp-permissions-com.wssyncmldm.xml
system/etc/sysconfig/meta-hiddenapi-package-allowlist.xml
system/etc/sysconfig/samsungauthframework.xml
system/etc/sysconfig/samsungpassapp.xml
system/priv-app/AuthFramework
system/priv-app/BCService
system/priv-app/CIDManager
system/priv-app/DiagMonAgent91
system/priv-app/FBInstaller_NS
system/priv-app/FBServices
system/priv-app/FacAtFunction
system/priv-app/FactoryTestProvider
system/priv-app/FotaAgent
system/priv-app/ModemServiceMode
system/priv-app/PaymentFramework
system/priv-app/SEMFactoryApp
system/priv-app/SOAgent7
system/priv-app/SamsungPass
system/priv-app/SmartEpdgTestApp
"

# Camera SDK
SYSTEM_DEBLOAT+="
system/etc/default-permissions/default-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/default-permissions/default-permissions-com.samsung.petservice.xml
system/etc/default-permissions/default-permissions-com.samsung.videoscan.xml
system/etc/permissions/cameraservice.xml
system/etc/permissions/privapp-permissions-com.samsung.android.globalpostprocmgr.xml
system/etc/permissions/privapp-permissions-com.samsung.petservice.xml
system/etc/permissions/privapp-permissions-com.samsung.videoscan.xml
system/framework/scamera_sep.jar
system/priv-app/GlobalPostProcMgr
system/priv-app/PetService
system/priv-app/SCameraSDKService
system/priv-app/VideoScan
"

# system_ext clean-up
SYSTEM_DEBLOAT+="
system/etc/permissions/org.carconnectivity.android.digitalkey.rangingintent.xml
system/etc/permissions/org.carconnectivity.android.digitalkey.secureelement.xml
"
SYSTEM_EXT_DEBLOAT+="
app/QCC
bin/qccsyshal@1.2-service
etc/init/vendor.qti.hardware.qccsyshal@1.2-service.rc
etc/permissions/com.qti.location.sdk.xml
etc/permissions/com.qualcomm.location.xml
etc/permissions/privapp-permissions-com.qualcomm.location.xml
framework/com.qti.location.sdk.jar
framework/org.carconnectivity.android.digitalkey.rangingintent.jar
framework/org.carconnectivity.android.digitalkey.secureelement.jar
lib/libqcc.so
lib/libqcc_file_agent_sys.so
lib/libqccdme.so
lib/libqccfileservice.so
lib/vendor.qti.hardware.qccsyshal@1.0.so
lib/vendor.qti.hardware.qccsyshal@1.1.so
lib/vendor.qti.hardware.qccsyshal@1.2.so
lib/vendor.qti.hardware.qccvndhal@1.0.so
lib/vendor.qti.qccvndhal_aidl-V1-ndk.so
lib64/libqcc.so
lib64/libqcc_file_agent_sys.so
lib64/libqccdme.so
lib64/libqccfileservice.so
lib64/vendor.qti.hardware.qccsyshal@1.0.so
lib64/vendor.qti.hardware.qccsyshal@1.1.so
lib64/vendor.qti.hardware.qccsyshal@1.2-halimpl.so
lib64/vendor.qti.hardware.qccsyshal@1.2.so
lib64/vendor.qti.hardware.qccvndhal@1.0.so
lib64/vendor.qti.qccvndhal_aidl-V1-ndk.so
priv-app/com.qualcomm.location
"

# Qualcomm IPA firmware blobs
VENDOR_DEBLOAT+="
firmware/ipa_fws.b00
firmware/ipa_fws.b01
firmware/ipa_fws.b02
firmware/ipa_fws.b03
firmware/ipa_fws.b04
firmware/ipa_fws.elf
firmware/ipa_fws.mdt
firmware/yupik_ipa_fws.b00
firmware/yupik_ipa_fws.b01
firmware/yupik_ipa_fws.b02
firmware/yupik_ipa_fws.b03
firmware/yupik_ipa_fws.b04
firmware/yupik_ipa_fws.elf
firmware/yupik_ipa_fws.mdt
"
