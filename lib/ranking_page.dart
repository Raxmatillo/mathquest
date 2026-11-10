import 'package:flutter/material.dart';

class DemoStudent {
  final String name, region, district, avatar;
  final int daily, weekly, monthly, total;
  const DemoStudent(this.name,this.region,this.district,this.avatar,this.daily,this.weekly,this.monthly,this.total);
  int score(int period) => [daily,weekly,monthly,total][period];
}
const demoStudents = <DemoStudent>[
  DemoStudent('Sardor','Andijon','Shahrixon','🧑🏻',180,860,2740,12450),
  DemoStudent('Azizbek','Andijon','Asaka','👦🏻',160,810,2560,11980),
  DemoStudent('Dilshod','Toshkent shahri','Chilonzor','🧒🏽',150,760,2490,11760),
  DemoStudent('Madina','Andijon','Shahrixon','👧🏻',145,720,2400,10920),
  DemoStudent('Umidjon','Farg‘ona','Qo‘qon','👦🏽',130,690,2200,10540),
  DemoStudent('Shahzoda','Namangan','Chust','👧🏽',120,660,2100,10320),
  DemoStudent('Bekzod','Andijon','Shahrixon','🧑🏽',115,610,2010,9750),
  DemoStudent('Laylo','Buxoro','Buxoro','👧🏻',105,580,1940,9310),
  DemoStudent('Asadbek','Samarqand','Urgut','👦🏻',98,550,1810,8920),
  DemoStudent('Ziyodulla','Andijon','Andijon','🧒🏻',90,510,1730,8650),
];

class RankingPage extends StatefulWidget {
  final String username, region, district;
  final int points;
  const RankingPage({super.key,required this.username,required this.points,required this.region,required this.district});
  @override State<RankingPage> createState()=>_RankingPageState();
}
class _RankingPageState extends State<RankingPage> {
  int area=0,period=1;
  static const periods=['Kunlik','Haftalik','Oylik','Butun davr'];
  static const areas=['Respublika','Viloyat','Shahar/tuman'];
  @override Widget build(BuildContext context) {
    final filtered=demoStudents.where((s)=>area==0 || (area==1?s.region==widget.region:s.region==widget.region&&s.district.toLowerCase()==widget.district.toLowerCase())).toList();
    final all=<({String name,String avatar,int score,bool mine})>[
      for(final s in filtered)(name:s.name,avatar:s.avatar,score:s.score(period),mine:false),
      if(widget.username.isNotEmpty)(name:'@${widget.username}',avatar:'🦊',score:period==3?widget.points:0,mine:true),
    ]..sort((a,b)=>b.score.compareTo(a.score));
    final scope=area==0?'O‘zbekiston':area==1?widget.region:'${widget.district}, ${widget.region}';
    return Container(color:const Color(0xFFF0F7FF),child:ListView(padding:const EdgeInsets.all(16),children:[
      const Text('🏆  Chempionlar reytingi',style:TextStyle(fontSize:24,fontWeight:FontWeight.w900,color:Color(0xFF17335F))),
      const SizedBox(height:5),
      const Text('🧪 DEV DEMO — 10 ta namunaviy o‘quvchi. Haqiqiy onlayn reyting emas.',style:TextStyle(fontSize:12,color:Color(0xFF687994))),
      const SizedBox(height:16),
      _choices(areas,area,(v)=>setState(()=>area=v)),
      const SizedBox(height:8),
      _choices(periods,period,(v)=>setState(()=>period=v)),
      const SizedBox(height:15),
      Container(padding:const EdgeInsets.all(15),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(24)),child:Column(children:[
        Text('📍 $scope',style:const TextStyle(fontSize:17,fontWeight:FontWeight.w800,color:Color(0xFF17335F))),
        const SizedBox(height:16),
        SizedBox(height:210,child:Row(crossAxisAlignment:CrossAxisAlignment.end,children:[
          for(final rank in [2,1,3]) Expanded(child:_podium(all,rank)),
        ])),
      ])),
      const SizedBox(height:17),
      const Text('Barcha ishtirokchilar',style:TextStyle(fontSize:20,fontWeight:FontWeight.w900,color:Color(0xFF17335F))),
      const SizedBox(height:9),
      if(all.isEmpty) const Card(child:Padding(padding:EdgeInsets.all(20),child:Text('Bu hudud uchun namunaviy o‘quvchi topilmadi. Respublika filtrini tanlang.'))),
      for(var i=0;i<all.length;i++) Container(margin:const EdgeInsets.only(bottom:8),padding:const EdgeInsets.symmetric(horizontal:12,vertical:10),decoration:BoxDecoration(color:all[i].mine?const Color(0xFFFFF2C6):Colors.white,borderRadius:BorderRadius.circular(17)),child:Row(children:[
        SizedBox(width:28,child:Text('${i+1}',style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold))),
        CircleAvatar(backgroundColor:const Color(0xFFE8F3FF),child:Text(all[i].avatar)),
        const SizedBox(width:10),
        Expanded(child:Text(all[i].name,maxLines:1,overflow:TextOverflow.ellipsis,style:const TextStyle(fontWeight:FontWeight.w800))),
        Text('${all[i].score} ⭐',style:const TextStyle(color:Color(0xFF1769E8),fontWeight:FontWeight.w900)),
      ])),
      const SizedBox(height:8),
      const Text('Kunlik, haftalik va oylik qiymatlar namunaviy ma’lumotlardir. Sizning real ballaringiz hozircha faqat “Butun davr” filtrida aks etadi.',style:TextStyle(fontSize:12,color:Color(0xFF687994))),
    ]));
  }
  Widget _choices(List<String> labels,int selected,ValueChanged<int> change)=>SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[
    for(var i=0;i<labels.length;i++) Padding(padding:const EdgeInsets.only(right:6),child:ChoiceChip(label:Text(labels[i]),selected:selected==i,onSelected:(_)=>change(i),selectedColor:const Color(0xFF1769E8),labelStyle:TextStyle(color:selected==i?Colors.white:const Color(0xFF17335F),fontWeight:FontWeight.w700))),
  ]));
  Widget _podium(List<({String name,String avatar,int score,bool mine})> users,int rank){
    final exists=users.length>=rank;
    final person=exists?users[rank-1]:null;
    final height=rank==1?148.0:rank==2?115.0:98.0;
    final color=rank==1?const Color(0xFFFFD15B):rank==2?const Color(0xFFCAD8EC):const Color(0xFFE9B18B);
    return Padding(padding:const EdgeInsets.symmetric(horizontal:3),child:Column(mainAxisAlignment:MainAxisAlignment.end,children:[
      Text(person?.avatar??'🔒',style:const TextStyle(fontSize:29)),
      Text(person?.name??'Bo‘sh',maxLines:1,overflow:TextOverflow.ellipsis,style:const TextStyle(fontSize:11,fontWeight:FontWeight.bold)),
      const SizedBox(height:5),
      Container(height:height,width:double.infinity,decoration:BoxDecoration(color:color,borderRadius:const BorderRadius.vertical(top:Radius.circular(17))),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
        Text(['🥇','🥈','🥉'][rank-1],style:const TextStyle(fontSize:33)),
        Text('$rank-o‘rin',style:const TextStyle(fontWeight:FontWeight.w900)),
        Text(person==null?'—':'${person.score}',style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold)),
      ])),
    ]));
  }
}
