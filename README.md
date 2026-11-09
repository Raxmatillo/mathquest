# MathQuest — Flutter demo (development mode)

## Ishga tushirish
1. Flutter SDK va Android Studio o'rnating.
2. Terminalda yangi Flutter platforma fayllarini yarating:
   `flutter create --project-name mathquest .`
3. `flutter pub get`
4. Android emulator yoki USB debugging yoqilgan telefonni ulang.
5. `flutter run`
6. APK: `flutter build apk --release` (fayl: `build/app/outputs/flutter-apk/app-release.apk`).

## Nimalar ishlaydi?
- DEV rejimda mahalliy ro'yxatdan o'tish; profilni SharedPreferences orqali saqlash
- 10 modul, 3x8 daraja + 1 takrorlash = 250 deterministik savol
- Mavzu tushuntirishi, variant tanlash va raqam kiritish
- Ball, seriya, nishon, progress, dark mode, refresh
- Botga qarshi arqon tortish va 15 savollik tezlik o'yini

## Muhim cheklovlar
- Google/Apple OAuth, username global noyobligi, haqiqiy leaderboard, do'stlar, multiplayer, haftalik grafik, profil rasmi va to'liq 3 tilda lokalizatsiya HOZIRCHA mavjud emas.
- 250 topshiriq parametrik tarzda generatsiya qilinadi, pedagogik tekshiruvdan o'tgan alohida kontent banki emas.
- Seriya faqat to'g'ri yoki noto'g'ri javob berilganda qayd etiladi, shunchaki kirishda emas.
- Arqon tortish demo bot bilan navbatma-navbat, vaqt chegarasisiz; real-time emas.
- Hozirgi mahalliy saqlash bolalar shaxsiy ma'lumotlarini production serverga uzatmaydi. Production uchun ota-ona roziligi, ma'lumotlarni minimallashtirish, moderation va maxfiylik siyosati talab etiladi.
- O'yin ballari offline rejimda ishonchli global reyting uchun ishlatilmasligi kerak: server tekshirishi zarur.
