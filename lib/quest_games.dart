import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'quest_art.dart';

const gameNavy=Color(0xFF17335F),gameBlue=Color(0xFF1769E8);
class RopeArena extends StatefulWidget {
 final VoidCallback onWin;
 const RopeArena({super.key,required this.onWin});
 @override State<RopeArena> createState()=>_RopeArenaState();
}
class _RopeArenaState extends State<RopeArena>{
 final random=Random();Timer? botTimer;
 int position=0,round=0,a=4,b=3;bool started=false,ended=false,awarded=false;
 @override void dispose(){botTimer?.cancel();super.dispose();}
 void startBot(){
  setState((){started=true;ended=false;position=0;round=0;next();});
  botTimer?.cancel();
  botTimer=Timer.periodic(const Duration(seconds:5),(_){
   if(!mounted||ended)return;
   setState((){position=max(-5,position-1);checkEnd();});
  });
 }
 void next(){a=random.nextInt(13)+2;b=random.nextInt(11)+1;}
 void checkEnd(){
  if(position>=5||position<=-5||round>=15){
   ended=true;botTimer?.cancel();
   if(position>0&&!awarded){awarded=true;widget.onWin();}
  }
 }
 void answer(int value){
  if(ended)return;
  setState((){position=(position+(value==a+b?1:-1)).clamp(-5,5).toInt();round++;checkEnd();if(!ended)next();});
 }
 @override Widget build(BuildContext context){
  final choices=<int>{a+b,a+b+1,max(0,a+b-1)}.toList()..shuffle(Random(round+7));
  return Scaffold(backgroundColor:const Color(0xFFF0F7FF),appBar:AppBar(title:const Text('🪢 Arqon tortish',style:TextStyle(fontWeight:FontWeight.w900))),body:SafeArea(child:ListView(padding:const EdgeInsets.all(20),children:[
   Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(gradient:const LinearGradient(colors:[gameBlue,Color(0xFF7350DD)]),borderRadius:BorderRadius.circular(25)),child:Column(children:[
    const Text('MATEMATIKA ARENASI',style:TextStyle(color:Colors.white70,fontWeight:FontWeight.bold)),
    const SizedBox(height:12),
    Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[const MikoFox(size:90),Column(children:[Text('VS',style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.w900)),Text(started?'AI bot':'Raqib',style:const TextStyle(color:Colors.white))]),const Text('🤖',style:TextStyle(fontSize:70))]),
    const SizedBox(height:20),
    Container(height:18,decoration:BoxDecoration(color:Colors.white24,borderRadius:BorderRadius.circular(20)),child:LayoutBuilder(builder:(_,box)=>Stack(children:[
     Positioned(left:0,top:0,bottom:0,width:box.maxWidth*((position+5)/10),child:Container(decoration:BoxDecoration(color:const Color(0xFFFFD15B),borderRadius:BorderRadius.circular(20)))),
     Positioned(left:(box.maxWidth*((position+5)/10)-9).clamp(0.0,box.maxWidth-18).toDouble(),top:0,child:const Icon(Icons.flag_rounded,size:18,color:Colors.white)),
    ]))),
    const SizedBox(height:10),
    Text('Siz: $position    •    Raund: $round/15',style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
   ])),
   const SizedBox(height:22),
   if(!started)...[
    const Text('Raqibni tanlang',style:TextStyle(fontSize:23,fontWeight:FontWeight.w900,color:gameNavy)),
    const SizedBox(height:12),
    const Card(child:ListTile(leading:Icon(Icons.wifi_off_rounded),title:Text('Onlayn raqib qidirish'),subtitle:Text('Server va matchmaking hali ulanmagan. Hozir haqiqiy onlayn qidiruv mavjud emas.'))),
    const SizedBox(height:12),
    FilledButton.icon(onPressed:startBot,icon:const Icon(Icons.smart_toy_rounded),label:const Text('AI bot bilan o‘ynash')),
   ]else if(ended)...[
    Center(child:Text(position>0?'🏆 G‘alaba!':'🎮 Bellashuv yakunlandi',style:const TextStyle(fontSize:24,fontWeight:FontWeight.w900,color:gameNavy))),
    const SizedBox(height:12),
    Center(child:Text(position>0?'Siz 30 ball yutdingiz!':'Yana mashq qilib ko‘ring!',style:const TextStyle(fontSize:16))),
    const SizedBox(height:20),
    FilledButton(onPressed:(){awarded=false;startBot();},child:const Text('Qayta o‘ynash')),
   ]else...[
    const Center(child:Text('To‘g‘ri javob berib arqonni tort!',style:TextStyle(fontWeight:FontWeight.w700,color:gameNavy))),
    const SizedBox(height:15),
    Center(child:Text('$a + $b = ?',style:const TextStyle(fontSize:42,fontWeight:FontWeight.w900,color:gameNavy))),
    const SizedBox(height:14),
    for(final n in choices)Padding(padding:const EdgeInsets.only(bottom:10),child:SizedBox(height:55,child:FilledButton.tonal(onPressed:()=>answer(n),child:Text('$n',style:const TextStyle(fontSize:23,fontWeight:FontWeight.bold))))),
   ],
  ])));
 }
}

class QuickMathArena extends StatefulWidget {
 final ValueChanged<int> onFinish;
 const QuickMathArena({super.key,required this.onFinish});
 @override State<QuickMathArena> createState()=>_QuickMathArenaState();
}
class _QuickMathArenaState extends State<QuickMathArena>{
 final random=Random();Timer? timer;
 int seconds=60,score=0,turn=0,a=4,b=2;bool started=false,ended=false;
 @override void dispose(){timer?.cancel();super.dispose();}
 void next(){a=random.nextInt(18)+1;b=random.nextInt(12)+1;}
 void start(){timer?.cancel();setState((){seconds=60;score=0;turn=0;started=true;ended=false;next();});timer=Timer.periodic(const Duration(seconds:1),(_){if(!mounted)return;setState((){seconds--;if(seconds<=0)finish();});});}
 void finish(){if(ended)return;ended=true;timer?.cancel();widget.onFinish(score);}
 void answer(int value){if(ended)return;setState((){if(value==a+b)score++;turn++;next();});}
 @override Widget build(BuildContext context){final choices=<int>{a+b,a+b+1,max(0,a+b-1)}.toList()..shuffle(Random(turn+5));return Scaffold(backgroundColor:const Color(0xFFF0F7FF),appBar:AppBar(title:const Text('⚡ Kim chaqqon?')),body:SafeArea(child:ListView(padding:const EdgeInsets.all(20),children:[
  Container(padding:const EdgeInsets.all(24),decoration:BoxDecoration(color:gameBlue,borderRadius:BorderRadius.circular(24)),child:Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Text('⏱️ $seconds s',style:const TextStyle(fontSize:23,color:Colors.white,fontWeight:FontWeight.w900)),Text('⭐ $score',style:const TextStyle(fontSize:23,color:Colors.white,fontWeight:FontWeight.w900))])),
  const SizedBox(height:28),
  if(!started)...[const Center(child:MikoFox(size:150)),const SizedBox(height:20),const Center(child:Text('60 soniyada imkon qadar ko‘p misol yeching!',textAlign:TextAlign.center,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:gameNavy))),const SizedBox(height:22),FilledButton(onPressed:start,child:const Text('Boshlash'))]
  else if(ended)...[Center(child:Text('🎉 $score ta to‘g‘ri javob!',style:const TextStyle(fontSize:25,fontWeight:FontWeight.w900,color:gameNavy))),const SizedBox(height:20),FilledButton(onPressed:start,child:const Text('Qayta o‘ynash'))]
  else...[Center(child:Text('$a + $b = ?',style:const TextStyle(fontSize:43,fontWeight:FontWeight.w900,color:gameNavy))),const SizedBox(height:24),for(final n in choices)Padding(padding:const EdgeInsets.only(bottom:12),child:SizedBox(height:60,child:FilledButton.tonal(onPressed:()=>answer(n),child:Text('$n',style:const TextStyle(fontSize:23,fontWeight:FontWeight.w800))))),const SizedBox(height:8),Text('Javob berilgan savollar: $turn',textAlign:TextAlign.center)],
 ])));}
}
