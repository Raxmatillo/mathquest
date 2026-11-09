import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  final String username, region, district;
  final int points;
  const RankingPage({super.key, required this.username, required this.points, required this.region, required this.district});
  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  int area = 0, period = 0;
  static const periods = ['Kunlik','Haftalik','Oylik','Butun davr'];
  static const areas = ['Respublika','Viloyat','Shahar / tuman'];
  @override
  Widget build(BuildContext context) {
    // Development-only preview; no fictitious competitors are presented as real users.
    final current = period == 3 ? widget.points : 0;
    final scope = area == 0 ? 'O‘zbekiston' : area == 1 ? widget.region : widget.district;
    final users = <({String name,int score})>[
      (name: '@${widget.username}', score: current),
    ]..sort((a,b)=>b.score.compareTo(a.score));
    return ListView(padding:const EdgeInsets.all(16),children:[
      Text('🏆 Reytinglar',style:Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight:FontWeight.w900)),
      const SizedBox(height:8),
      Text('Hududni tanlang',style:Theme.of(context).textTheme.titleMedium),
      const SizedBox(height:8),
      SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[
        for(var i=0;i<areas.length;i++) Padding(padding:const EdgeInsets.only(right:8),child:ChoiceChip(label:Text(areas[i]),selected:area==i,onSelected:(_)=>setState(()=>area=i)))
      ])),
      const SizedBox(height:12),
      SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[
        for(var i=0;i<periods.length;i++) Padding(padding:const EdgeInsets.only(right:6),child:ChoiceChip(label:Text(periods[i]),selected:period==i,onSelected:(_)=>setState(()=>period=i)))
      ])),
      const SizedBox(height:14),
      Card(child:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
        Text('📍 $scope',style:const TextStyle(fontWeight:FontWeight.bold,fontSize:18)),
        const SizedBox(height:8),
        const Text('DEV REJIM • Namoyish ma’lumotlari',style:TextStyle(fontSize:12)),
        const SizedBox(height:12),
        Row(crossAxisAlignment:CrossAxisAlignment.end,children:[
          for(final rank in [2,1,3]) Expanded(child:Container(
            margin:const EdgeInsets.symmetric(horizontal:3),
            height:rank==1?142:105,
            decoration:BoxDecoration(color:[const Color(0xFFFFD56A),const Color(0xFFCAD5E3),const Color(0xFFDFB38E)][rank-1].withValues(alpha:.4),borderRadius:BorderRadius.circular(18)),
            child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
              Text(rank==1?'🥇':rank==2?'🥈':'🥉',style:const TextStyle(fontSize:30)),
              Text('$rank-o‘rin',style:const TextStyle(fontWeight:FontWeight.bold)),
              Text(rank==1 && users.isNotEmpty?users.first.name:'Bo‘sh',maxLines:1,overflow:TextOverflow.ellipsis),
              if(rank==1 && users.isNotEmpty) Text('${users.first.score} ball')
            ]),
          ))
        ]),
      ]))),
      const SizedBox(height:16),
      Text('4-o‘rindan keyingi ishtirokchilar',style:Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight:FontWeight.bold)),
      const SizedBox(height:8),
      if(users.length<=3) const Card(child:Padding(padding:EdgeInsets.all(20),child:Text('Hozircha boshqa ishtirokchilar yo‘q. Haqiqiy reytinglar server ishga tushgach paydo bo‘ladi.'))),
      for(var i=3;i<users.length;i++) Card(child:ListTile(leading:CircleAvatar(child:Text('${i+1}')),title:Text(users[i].name),trailing:Text('${users[i].score} ball'))),
      const SizedBox(height:8),
      const Text('Eslatma: kunlik, haftalik va oylik ballar uchun tarix hali yig‘ilmaydi, shuning uchun 0 ko‘rsatiladi. Server va sana bo‘yicha ball tarixi qo‘shilgach aniq hisoblanadi.',style:TextStyle(fontSize:12)),
    ]);
  }
}
