import 'package:flutter/material.dart';

const questBlue = Color(0xFF1769E8);
const questNavy = Color(0xFF17335F);
const questGold = Color(0xFFFFC83D);
const questMint = Color(0xFF29C987);

class QuestHome extends StatelessWidget {
  final String name;
  final int points, streak, completed;
  final VoidCallback onContinue, onGames, onRanking, onMissions;
  const QuestHome({super.key, required this.name, required this.points, required this.streak, required this.completed, required this.onContinue, required this.onGames, required this.onRanking, required this.onMissions});

  @override
  Widget build(BuildContext context) {
    final progress = (completed % 25) / 25;
    return Container(
      color: const Color(0xFFF0F7FF),
      child: ListView(padding: const EdgeInsets.fromLTRB(18, 12, 18, 26), children: [
        Row(children: [
          const CircleAvatar(radius: 27, backgroundColor: Color(0xFFFFE8B4), child: Text('🦊', style: TextStyle(fontSize: 29))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Salom, ${name.isEmpty ? 'Do‘stim' : name.split(' ').first}! 👋', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: questNavy)),
            const Text('Matematika sarguzashti kutmoqda!', style: TextStyle(fontSize: 12, color: Color(0xFF637795))),
          ])),
        ]),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(child: _metric('🔥', '$streak kun', 'Faollik')),
          const SizedBox(width: 8),
          Expanded(child: _metric('⭐', '$points', 'Ball')),
          const SizedBox(width: 8),
          Expanded(child: _metric('💎', '${points ~/ 100}', 'Mukofot')),
        ]),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1769E8), Color(0xFF6749DF)]), borderRadius: BorderRadius.circular(28)),
          child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Expanded(child: Text('Matematika sarguzashtiga tayyormisan?', style: TextStyle(fontSize: 23, height: 1.2, fontWeight: FontWeight.w900, color: Colors.white))),
              Text('🦊', style: TextStyle(fontSize: 70)),
            ]),
            const SizedBox(height: 12),
            const Text('Miko bilan yangi bilimlarni kashf et!', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 16),
            _action('Boshlash  ▶', onContinue, questGold, questNavy),
          ])),
        ),
        const SizedBox(height: 22),
        _heading('Mening darslarim', onMissions),
        const SizedBox(height: 10),
        InkWell(onTap: onContinue, borderRadius: BorderRadius.circular(24), child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Color(0x110C4E98), blurRadius: 15, offset: Offset(0, 6))]),
          child: Row(children: [
            Container(width: 64, height: 70, decoration: BoxDecoration(color: const Color(0xFFD8F8E9), borderRadius: BorderRadius.circular(17)), alignment: Alignment.center, child: const Text('🏝️', style: TextStyle(fontSize: 38))),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('1-modul', style: TextStyle(color: questBlue, fontWeight: FontWeight.bold)),
              const Text('Sonlar olami', style: TextStyle(fontSize: 19, color: questNavy, fontWeight: FontWeight.w900)),
              const SizedBox(height: 9),
              ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: progress, minHeight: 9, backgroundColor: const Color(0xFFE5EDF8), color: questMint)),
              const SizedBox(height: 5),
              Text('${(progress * 100).round()}% bajarildi', style: const TextStyle(fontSize: 12, color: Color(0xFF637795))),
            ])),
            const Icon(Icons.arrow_forward_ios_rounded, color: questBlue, size: 18),
          ]),
        )),
        const SizedBox(height: 22),
        _heading('O‘yinlar', onGames),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _game('🏆', 'Arqon tortish', const Color(0xFF6947E8), onGames)),
          const SizedBox(width: 12),
          Expanded(child: _game('⚡', 'Kim chaqqon?', const Color(0xFF00A9CE), onGames)),
        ]),
        const SizedBox(height: 18),
        _action('🏅  Reytingni ko‘rish', onRanking, Colors.white, questBlue),
      ]),
    );
  }

  Widget _metric(String emoji, String value, String label) => Container(
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
    child: Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 24)),
      const SizedBox(height: 3),
      Text(value, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: questNavy)),
      Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF64758D))),
    ]),
  );

  Widget _heading(String title, VoidCallback action) => Row(children: [
    Expanded(child: Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: questNavy))),
    TextButton(onPressed: action, child: const Text('Barchasi ›')),
  ]);

  Widget _game(String emoji, String title, Color color, VoidCallback action) => InkWell(
    onTap: action, borderRadius: BorderRadius.circular(22),
    child: Container(height: 125, padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(22)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(emoji, style: const TextStyle(fontSize: 43)),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900)),
      ])),
  );

  Widget _action(String title, VoidCallback action, Color bg, Color fg) => SizedBox(width: double.infinity, height: 51, child: ElevatedButton(
    onPressed: action,
    style: ElevatedButton.styleFrom(backgroundColor: bg, foregroundColor: fg, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17))),
    child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
  ));
}

class QuestMissions extends StatelessWidget {
  final List<String> modules;
  final Set<int> done;
  final ValueChanged<int> openLesson;
  const QuestMissions({super.key, required this.modules, required this.done, required this.openLesson});

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFFF0F7FF),
    child: ListView(padding: const EdgeInsets.fromLTRB(16, 12, 16, 30), children: [
      const Text('🗺️  Sarguzasht xaritasi', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: questNavy)),
      const SizedBox(height: 5),
      const Text('Har bir orolda yangi bilimlar seni kutmoqda!', style: TextStyle(color: Color(0xFF637795))),
      const SizedBox(height: 18),
      for (var m = 0; m < modules.length; m++) _island(m),
    ]),
  );

  Widget _island(int m) {
    final count = List.generate(25, (i) => m * 25 + i).where(done.contains).length;
    final available = m == 0 || done.contains(m * 25 - 1);
    const icons = ['🏝️','🌿','🏔️','🏰','🌊','🌈','🔷','🚀','📜','🧠'];
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: available ? const [Color(0xFF1882F1), Color(0xFF3C62DC)] : const [Color(0xFF8A9AB4), Color(0xFF6D809E)]),
        borderRadius: BorderRadius.circular(27),
        boxShadow: const [BoxShadow(color: Color(0x180D59A7), blurRadius: 14, offset: Offset(0, 6))],
      ),
      child: Column(children: [
        Row(children: [
          Text(icons[m % icons.length], style: const TextStyle(fontSize: 49)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${m + 1}-modul', style: const TextStyle(color: Color(0xFFFFDF6B), fontWeight: FontWeight.w800)),
            Text(modules[m], style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w900)),
            Text('$count / 25 topshiriq', style: const TextStyle(color: Colors.white70)),
          ])),
          if (!available) const Icon(Icons.lock_rounded, color: Colors.white, size: 30),
        ]),
        const SizedBox(height: 16),
        ClipRRect(borderRadius: BorderRadius.circular(12), child: LinearProgressIndicator(value: count / 25, minHeight: 8, backgroundColor: Colors.white24, color: questGold)),
        const SizedBox(height: 19),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          for (var level = 0; level < 4; level++) _node(m, level, available),
        ]),
        const SizedBox(height: 8),
        Text(available ? 'Bosqichni tanlang va sarguzashtni boshlang!' : 'Oldingi modulni yakunlang', style: const TextStyle(color: Colors.white, fontSize: 12)),
      ]),
    );
  }

  Widget _node(int m, int level, bool available) {
    final id = m * 25 + (level == 3 ? 24 : level * 8);
    final unlocked = available && (level == 0 || done.contains(id - 1));
    final finished = level == 3 ? done.contains(id) : List.generate(8, (i) => id + i).every(done.contains);
    return Column(children: [
      InkWell(
        onTap: unlocked ? () => openLesson(id) : null,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 59, width: 59,
          decoration: BoxDecoration(shape: BoxShape.circle, color: finished ? questMint : unlocked ? questGold : const Color(0xFFB7C5DB), border: Border.all(color: Colors.white, width: 4)),
          alignment: Alignment.center,
          child: Text(finished ? '⭐' : !unlocked ? '🔒' : level == 3 ? '🏆' : '${level + 1}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: questNavy)),
        ),
      ),
      const SizedBox(height: 6),
      Text(level == 3 ? 'Final' : 'Level ${level + 1}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
    ]);
  }
}
