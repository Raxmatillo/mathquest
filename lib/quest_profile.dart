import 'package:flutter/material.dart';
import 'quest_art.dart';
const profileNavy=Color(0xFF17335F),profileBlue=Color(0xFF1769E8);
class QuestProfile extends StatelessWidget{
 final String name,username,region,district,school,lang;
 final int grade,age,points,completed,streak,bestStreak,minutes;
 final bool dark;
 final ValueChanged<bool> onDark;
 final ValueChanged<String> onLanguage;
 const QuestProfile({super.key,required this.name,required this.username,required this.region,required this.district,required this.school,required this.lang,required this.grade,required this.age,required this.points,required this.completed,required this.streak,required this.bestStreak,required this.minutes,required this.dark,required this.onDark,required this.onLanguage});
 @override Widget build(BuildContext context)=>Container(color:const Color(0xFFF0F7FF),child:ListView(padding:const EdgeInsets.all(16),children:[
  Container(padding:const EdgeInsets.all(24),decoration:BoxDecoration(gradient:const LinearGradient(colors:[profileBlue,Color(0xFF7253E5)]),borderRadius:BorderRadius.circular(28)),child:Column(children:[
   Container(padding:const EdgeInsets.all(8),decoration:const BoxDecoration(color:Colors.white,shape:BoxShape.circle),child:const MikoFox(size:95)),
   const SizedBox(height:12),
   Text(name,style:const TextStyle(fontSize:24,fontWeight:FontWeight.w900,color:Colors.white),textAlign:TextAlign.center),
   Text('@$username',style:const TextStyle(color:Colors.white70)),
   const SizedBox(height:13),
   Wrap(alignment:WrapAlignment.center,spacing:8,runSpacing:8,children:[
    _pill('$grade-sinf'),_pill('$age yosh'),_pill('📍 $region'),
   ]),
  ])),
  const SizedBox(height:18),
  const Text('Mening yutuqlarim',style:TextStyle(fontSize:21,fontWeight:FontWeight.w900,color:profileNavy)),
  const SizedBox(height:10),
  Row(children:[Expanded(child:_stat('⭐','$points','Ball')),const SizedBox(width:10),Expanded(child:_stat('📖','$completed','Topshiriq'))]),
  const SizedBox(height:10),
  Row(children:[Expanded(child:_stat('🔥','$streak','Kunlik seriya')),const SizedBox(width:10),Expanded(child:_stat('🏆','$bestStreak','Rekord'))]),
  const SizedBox(height:10),
  _info(Icons.timer_rounded,'O‘rganish vaqti','$minutes daqiqa'),
  const SizedBox(height:18),
  const Text('Nishonlar',style:TextStyle(fontSize:21,fontWeight:FontWeight.w900,color:profileNavy)),
  const SizedBox(height:10),
  Row(children:[Expanded(child:_badge('🌟','Ilk qadam',completed>=1)),const SizedBox(width:8),Expanded(child:_badge('📚','25 savol',completed>=25)),const SizedBox(width:8),Expanded(child:_badge('🔥','3 kun',bestStreak>=3))]),
  const SizedBox(height:18),
  const Text('Ma’lumotlar va sozlamalar',style:TextStyle(fontSize:21,fontWeight:FontWeight.w900,color:profileNavy)),
  const SizedBox(height:10),
  _info(Icons.location_city_rounded,'Tuman / shahar',district),
  _info(Icons.school_rounded,'Maktab',school.isEmpty?'Kiritilmagan':school),
  Card(child:SwitchListTile(title:const Text('Tungi rejim'),subtitle:const Text('Ilova ranglar sxemasini almashtirish'),secondary:const Icon(Icons.dark_mode_rounded),value:dark,onChanged:onDark)),
  Card(child:ListTile(leading:const Icon(Icons.language_rounded),title:const Text('Til'),subtitle:const Text('Boshqa tillar tarjimasi hali to‘liq emas'),trailing:DropdownButton<String>(value:lang,items:const [DropdownMenuItem(value:'uz',child:Text('O‘zbek')),DropdownMenuItem(value:'ru',child:Text('Русский')),DropdownMenuItem(value:'en',child:Text('English'))],onChanged:(v){if(v!=null)onLanguage(v);}),)),
  const Padding(padding:EdgeInsets.all(10),child:Text('DEV profil • Ma’lumotlar hozircha faqat qurilmada saqlanadi.',style:TextStyle(color:Color(0xFF6B7A92),fontSize:12))),
 ]));
 Widget _pill(String label)=>Container(padding:const EdgeInsets.symmetric(horizontal:13,vertical:7),decoration:BoxDecoration(color:Colors.white24,borderRadius:BorderRadius.circular(30)),child:Text(label,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold)));
 Widget _stat(String emoji,String value,String label)=>Container(padding:const EdgeInsets.all(18),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(20)),child:Column(children:[Text(emoji,style:const TextStyle(fontSize:28)),Text(value,style:const TextStyle(fontSize:23,fontWeight:FontWeight.w900,color:profileNavy)),Text(label,style:const TextStyle(fontSize:12,color:Color(0xFF6B7A92)))]));
 Widget _badge(String emoji,String title,bool earned)=>Container(padding:const EdgeInsets.symmetric(vertical:16,horizontal:4),decoration:BoxDecoration(color:earned?const Color(0xFFFFF1C4):Colors.white,borderRadius:BorderRadius.circular(18)),child:Column(children:[Text(earned?emoji:'🔒',style:const TextStyle(fontSize:29)),const SizedBox(height:5),Text(title,style:const TextStyle(fontSize:12,fontWeight:FontWeight.bold,color:profileNavy))]));
 Widget _info(IconData icon,String title,String value)=>Card(child:ListTile(leading:Icon(icon,color:profileBlue),title:Text(title),subtitle:Text(value),));
}
