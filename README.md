<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>

<p align="center">
  <a href="https://github.com/vinisg61-coder/UN1CA/blob/sixteen/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/vinisg61-coder/UN1CA?style=for-the-badge&logo=github"/></a>
  <a href="https://github.com/vinisg61-coder/UN1CA/commits/sixteen"><img loading="lazy" src="https://img.shields.io/github/last-commit/vinisg61-coder/UN1CA/sixteen?style=for-the-badge"/></a>
  <a href="https://github.com/vinisg61-coder/UN1CA/actions/workflows/build.yml"><img loading="lazy" src="https://img.shields.io/github/actions/workflow/status/vinisg61-coder/UN1CA/build.yml?style=for-the-badge"/></a>
</p>

---

# un1ca

Custom firmware based on [UN1CA](https://github.com/salvogiangri/UN1CA) for the Samsung Galaxy A52s 5G (SM-A528B/N). Focused on a clean, light and debloated One UI 8 (Android 16) experience with Knox removed and Galaxy AI stripped out.

## Device

| | |
|---|---|
| Device | Samsung Galaxy A52s 5G |
| Model | SM-A528B/N |
| Platform | Snapdragon 778G (SM7325) |
| Base | UN1CA Android 16 / One UI 8 |

## Features

Included:
- Nuclear Knox removal (all Knox apps, libs, permissions and services)
- Galaxy AI removed (SLens, Pet Detector, AICore, BixbyVision)
- Aggressive debloat (~2GB+ less than stock): Facebook, Samsung Kids, AR Emoji, Samsung Pass and more
- FOD optical fingerprint configured
- WiFi 6E enabled
- HW mDNIe disabled (display processing optimized)
- Game Booster updated
- Full UN1CA Settings (SecSettings) with all UN1CA features

Removed:
- Knox apps and services (KnoxFrameBufferProvider, KnoxGuard, KnoxMposAgent, KnoxSandbox, libknox_*.so, libsdp_*.so, libdualdar.so)
- Galaxy AI (SLens, Pet Detector, AICore, BixbyVision, Traceur)
- Facebook services, Samsung Kids, AR Emoji, Samsung Pass
- All Knox permissions and configurations

## Downloads

Latest build: [GitHub Actions](https://github.com/vinisg61-coder/UN1CA/actions/workflows/build.yml) -> Artifacts -> `un1ca-a52sxq-rom.zip`

## Installation

1. Boot to TWRP recovery
2. Format Data (if coming from a different ROM)
3. `adb shell twrp decrypt "default_password"` (no PIN/Pattern set)
4. Flash `un1ca-*.zip`
5. Wipe Dalvik/ART Cache
6. Reboot

## Info

| | |
|---|---|
| Developer | vinisg61 |
| Version | 1.0.0 |
| Base | UN1CA 3.1.0 |
| Android | 16 (One UI 8) |

## Changelog

### v1.0.0
- Initial release
- Nuclear Knox removal
- Galaxy AI removed
- Aggressive debloat
- All UN1CA features preserved

## Credits

- [Salvo Giangreco](https://github.com/salvogiangri) - UN1CA project
- [ShaDisNX255](https://github.com/ShaDisNX255) - NcX ROM inspiration
- [DavidArsene](https://github.com/DavidArsene), [paulowesll](https://github.com/paulowesll), [Simon1511](https://github.com/Simon1511), [ananjaser1211](https://github.com/ananjaser1211), [Fede2782](https://github.com/Fede2782), [iDrinkCoffee](https://github.com/iDrinkCoffee-TG), [RisenID](https://github.com/RisenID) - help and contributions
- [LineageOS Team](https://www.lineageos.org/) - original [OTA updater implementation](https://github.com/LineageOS/android_packages_apps_Updater)
- All UN1CA project forks, contributors, testers and users

## License

Licensed under the [GNU General Public License v3.0](LICENSE). Based on [UN1CA](https://github.com/salvogiangri/UN1CA) by Salvo Giangreco.

## AOD fullscreen sempre ativo

O alvo `a52sxq` habilita a capacidade nativa de **Full Screen AOD** por meio de `SEC_FLOATING_FEATURE_LCD_CONFIG_AOD_FULLSCREEN=1`. A build também define `aod_mode=1` e `aod_show_state=1` nos defaults do `SettingsProvider`, deixando o AOD ligado e em exibição contínua quando o banco de configurações do usuário é criado. O comportamento continua editável em **Configurações > Tela de bloqueio e AOD > Always On Display** após a instalação.

A função é aplicada diretamente pelo workflow normal do GitHub Actions e não requer root, módulo Magisk/KernelSU ou configuração manual posterior. Em instalações que preservam o banco de configurações antigo, os valores já existentes podem permanecer; para garantir o default da ROM, use uma instalação limpa.
