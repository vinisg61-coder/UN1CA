<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>

<p align="center">
  <a href="https://github.com/vinisg61-coder/NERV-Remastered/blob/sixteen/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/vinisg61-coder/NERV-Remastered?style=for-the-badge&logo=github"/></a>
  <a href="https://github.com/vinisg61-coder/NERV-Remastered/commits/sixteen"><img loading="lazy" src="https://img.shields.io/github/last-commit/vinisg61-coder/NERV-Remastered/sixteen?style=for-the-badge"/></a>
  <a href="https://github.com/vinisg61-coder/NERV-Remastered/actions/workflows/build.yml"><img loading="lazy" src="https://img.shields.io/github/actions/workflow/status/vinisg61-coder/NERV-Remastered/build.yml?style=for-the-badge"/></a>
</p>

<p align="center">
  <b>ProjectNERV</b> - Clean. Light. Yours.
</p>

<p align="center">
  <a href="https://github.com/vinisg61-coder/NERV-Remastered">📥 Downloads</a>
  •
  <a href="https://github.com/vinisg61-coder/NERV-Remastered/issues">🐛 Report Bug</a>
</p>

---

# What is ProjectNERV?

**ProjectNERV** is a customized version of [UN1CA](https://github.com/salvogiangri/UN1CA) for the **Samsung Galaxy A52s 5G (SM-A528B/N)**, focused on:

- 💀 **Nuclear Knox Removal** - Complete Knox removal from system
- 🤖 **Galaxy AI Removed** - No bloat AI features
- 🧹 **Aggressive Debloat** - ~2GB+ less bloat than stock
- ⚡ **Performance Optimized** - Clean and light experience

---

# Device

| | |
|---|---|
| **Device** | Samsung Galaxy A52s 5G |
| **Model** | SM-A528B/N |
| **Platform** | Snapdragon 778G (SM7325) |
| **Base** | UN1CA Android 16 / One UI 8 |

---

# Features

### ✅ What's Included

- **Nuclear Knox Removal** - All Knox apps, libs, permissions and services removed
- **Galaxy AI Removed** - No SLens, Pet Detector, AICore, BixbyVision
- **Aggressive Debloat** - Facebook, Samsung Kids, AR Emoji, Samsung Pass and more removed
- **FOD Optical Configured** - Fingerprint unlock optimized for A52s optical sensor
- **WiFi 6E Enabled** - Next-gen WiFi support
- **HW mDNIe Disabled** - Display processing optimized
- **Game Booster Updated** - Latest version from Galaxy Store
- **UN1CA Settings** - Full SecSettings with all UN1CA features

### ❌ What's Removed

- Knox Apps (KnoxFrameBufferProvider, KnoxGuard, KnoxMposAgent, KnoxSandbox, etc.)
- Knox Services & Libraries (libknox_*.so, libsdp_*.so, libdualdar.so)
- Galaxy AI (SLens, Pet Detector, AICore, BixbyVision, Traceur)
- Facebook Services
- Samsung Kids, AR Emoji, Samsung Pass
- All Knox permissions and configurations

---

# Status

| Feature | Status |
|---------|--------|
| Boot | ✅ Working |
| WiFi | ✅ Working |
| Bluetooth | ✅ Working |
| Calls/SMS | ✅ Working |
| NFC | ✅ Working |
| Camera | ✅ Working |
| Decrypt | ✅ Working |
| Knox Removal | ✅ Confirmed |
| Debloat | ✅ Confirmed |

---

# Downloads

**Latest Build:** [GitHub Actions](https://github.com/vinisg61-coder/NERV-Remastered/actions/workflows/build.yml) → Artifacts → `ProjectNERV-a52sxq-rom.zip`

---

# Installation

1. Boot to TWRP recovery
2. Format Data (if coming from different ROM)
3. `adb shell twrp decrypt "default_password"` (no PIN/Pattern)
4. Flash `ProjectNERV-*.zip`
5. Wipe Dalvik/ART Cache
6. Reboot

---

# Info

| | |
|---|---|
| **Developer** | vinisg61 |
| **Version** | 1.0.0 |
| **Base** | UN1CA 3.1.0 |
| **Android** | 16 (One UI 8) |

---

# Changelog

### v1.0.0
- Initial release
- Nuclear Knox Removal
- Galaxy AI Removed
- Aggressive Debloat
- All UN1CA features preserved

---

# Credits

- **[Salvo Giangreco](https://github.com/salvogiangri)** - UN1CA Project
- **[ShaDisNX255](https://github.com/ShaDisNX255)** - NcX ROM inspiration

---

# License

This project is licensed under the terms of the [GNU General Public License v3.0](LICENSE).

Based on [UN1CA](https://github.com/salvogiangri/UN1CA) by Salvo Giangreco.
- **[DavidArsene](https://github.com/DavidArsene)** for his help and time
- **[paulowesll](https://github.com/paulowesll)** for his help and support
- **[Simon1511](https://github.com/Simon1511)** for his support and some of the device-specific patches
- **[ananjaser1211](https://github.com/ananjaser1211)** for troubleshooting and his time
- **[Fede2782](https://github.com/Fede2782)** for his contributions and help with Exynos/MTK support
- **[iDrinkCoffee](https://github.com/iDrinkCoffee-TG)** and **[RisenID](https://github.com/RisenID)** for their support
- **[LineageOS Team](https://www.lineageos.org/)** for their original [OTA updater implementation](https://github.com/LineageOS/android_packages_apps_Updater)
- *All the UN1CA project forks, contributors, testers and users ❤️*

# Stargazers over time
[![Stargazers over time](https://starchart.cc/salvogiangri/UN1CA.svg)](https://starchart.cc/salvogiangri/UN1CA)
