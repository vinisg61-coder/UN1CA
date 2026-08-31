<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>

<p align="center">
  <a href="https://github.com/vinisg61-coder/UN1CA/blob/sixteen/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/vinisg61-coder/UN1CA?style=for-the-badge&logo=github"/></a>
  <a href="https://github.com/vinisg61-coder/UN1CA/commits/sixteen"><img loading="lazy" src="https://img.shields.io/github/last-commit/vinisg61-coder/UN1CA/sixteen?style=for-the-badge"/></a>
  <a href="https://github.com/vinisg61-coder/UN1CA/actions/workflows/build.yml"><img loading="lazy" src="https://img.shields.io/github/actions/workflow/status/vinisg61-coder/UN1CA/build.yml?style=for-the-badge"/></a>
</p>

---

# Krypton ROM for Galaxy A52s 5G

Custom firmware based on the upstream [UN1CA](https://github.com/salvogiangreco/UN1CA) for the Samsung Galaxy A52s 5G (SM-A528B/N).

## Features

- One UI 8 based on Android 16
- Debloated system with Knox and Galaxy AI removed
- Krypton ROM Settings and updated Game Booster
- Snapdragon 778G / SM7325 device configuration
- Wi-Fi 6E, optical fingerprint and HFR support
- Native full-screen Always On Display enabled

## Build

Build the ROM through [GitHub Actions](https://github.com/vinisg61-coder/UN1CA/actions/workflows/build.yml) and download the generated artifact.

## Installation

1. Boot to TWRP recovery.
2. Format Data when coming from another ROM.
3. Flash the generated `KryptonROM_*.zip` package.
4. Wipe Dalvik/ART Cache and reboot.

## Credits

- [Salvo Giangreco](https://github.com/salvogiangreco) - UN1CA project
- UN1CA contributors, forks, testers and users

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
