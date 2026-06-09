# Zur Small Resources

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Framework](https://img.shields.io/badge/framework-QBCore-red)
![Optimization](https://img.shields.io/badge/optimization-0.00ms-brightgreen)

[TR] **Zur Small Resources**, roleplay (RP) sunucuları (özellikle hardcore ve çöl konseptli sunucular) için geliştirilmiş, 0.00ms idle tüketimine sahip, tek bir config dosyasından yönetilen 13 farklı yaşam kalitesi (QoL) ve gerçekçilik modülünü içeren devasa bir kaynaktır.

[EN] **Zur Small Resources** is a massive, highly-optimized (0.00ms idle) Quality of Life (QoL) and immersion pack tailored for Roleplay (RP) servers (especially hardcore/desert themes). It contains 13 unique modules managed from a single config file.

---

## 🚀 Features (Özellikler)

*   🐦 **Dynamic Ambient Sounds:** Bird chirps in the morning (06:00-09:00), Cicada buzzing at night (22:00-05:00) / *Sabahları kuş cıvıltıları, geceleri ağustos böceği sesleri.*
*   🏎️ **Off-Road Penalty:** Sports and Super cars bursting tires if speeding (>80km/h) on dirt/sand / *Spor/Süper araçların toprakta hız yapınca lastik patlatması.*
*   🌪️ **Sandstorm Blindness:** Blurred vision during smog/blizzard unless wearing a mask or glasses / *Kum fırtınasında gözlük/maske yoksa görüşün bulanıklaşması.*
*   🩸 **Dynamic Pain & Blood:** Realistic stagger animations, facial grimaces, and blood pools based on damage taken / *Hasar yüzdesine göre gerçekçi sarsılma, yüz buruşturma ve kan gölü oluşturma.*
*   🏜️ **Heat Exhaustion:** Move speed reduction and extra thirst drain in extreme desert heat / *Çöl sıcağında yürüme yavaşlaması ve ekstra susuzluk.*
*   🎯 **Gun Sway:** Severe screen shake while aiming if injured or exhausted / *Yaralı veya yorgunken nişan alırken ekranın/ellerin titremesi.*
*   🔧 **Weapon Jamming:** Weapons jam after firing too many bullets continuously without a cooldown / *Aralıksız mermi spam'inde silahın tutukluk yapması.*
*   🔊 **Gunshot Echoes:** Cinematic indoor (long) and outdoor (short) gunshot echoes / *Açık ve kapalı alana duyarlı sinematik silah yankıları.*
*   💥 **Fall Damage Overhaul:** Custom mathematical fall damage calculation fixing native GTA physics / *Native GTA mekaniğini ezen özel düşme hasarı matematiği.*
*   🤛 **Anti-Spam Melee:** 200ms mandatory windup animation for punches to prevent spam / *Yumruk spam'ini engelleyen zorunlu hazırlık animasyonu.*
*   🚗 **Dynamic Vehicle Dirt:** Vehicles get dirty extremely fast on dirt/sand surfaces / *Toprak zeminde araçların saniyeler içinde kirlenmesi.*
*   🛑 **Brake Lights Fix:** Guarantees brake lights turn on reliably / *Fren lambası bug'ını kesin olarak çözer.*
*   👀 **Natural Blink:** Peds naturally blink every 2-5 seconds / *Karakterlerin doğal göz kırpması.*

## ⚙️ Installation (Kurulum)

1. Download the repository / *Repoyu indirin.*
2. Put `zur-smallresources` into your `resources` folder / *Dosyayı resources klasörüne atın.*
3. Ensure the script in your `server.cfg`:
   ```cfg
   ensure zur-smallresources
   ```
4. Edit `shared/config.lua` to enable/disable features according to your server's needs / *Özellikleri `shared/config.lua` üzerinden açıp kapatın.*

## 💻 Performance (Performans)
- **Idle:** 0.00ms
- **Active:** ~0.01ms (Highly optimized using dynamic sleep threads / *Dinamik uyku döngüleri sayesinde sıfır tüketim*)

## 📄 License
This project is open-source. Do whatever you want! / *Açık kaynaktır, dilediğiniz gibi kullanın.*
