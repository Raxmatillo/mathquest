import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Vector artwork: consistent on Android, iOS and web, with no external image assets.
class MikoFox extends StatelessWidget {
  final double size;
  const MikoFox({super.key,this.size=80});
  @override Widget build(BuildContext context)=>SizedBox(width:size,height:size,child:CustomPaint(painter:_FoxPainter()));
}
class _FoxPainter extends CustomPainter {
 @override void paint(Canvas c,Size s){
  c.save();c.scale(s.width/100,s.height/100);
  final orange=Paint()..color=const Color(0xFFFF9838),white=Paint()..color=Colors.white,navy=Paint()..color=const Color(0xFF27375B);
  Path ear(bool left){final x=left?20.0:80.0;return Path()..moveTo(x,43)..lineTo(left?10:90,5)..quadraticBezierTo(left?34:66,21,x,43)..close();}
  c.drawPath(ear(true),orange);c.drawPath(ear(false),orange);
  c.drawOval(const Rect.fromLTWH(12,23,76,69),orange);
  final cheeks=Path()..moveTo(14,60)..quadraticBezierTo(25,84,50,91)..quadraticBezierTo(75,84,86,60)..quadraticBezierTo(72,62,50,78)..quadraticBezierTo(28,62,14,60);
  c.drawPath(cheeks,white);
  c.drawOval(const Rect.fromLTWH(31,50,7,10),navy);c.drawOval(const Rect.fromLTWH(62,50,7,10),navy);
  c.drawCircle(const Offset(50,74),5,navy);
  c.drawArc(const Rect.fromLTWH(42,76,16,8),0,math.pi,false,Paint()..color=navy.color..style=PaintingStyle.stroke..strokeWidth=2);
  c.restore();
 }
 @override bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}
class IslandArt extends StatelessWidget {
 final double size;final int variant;
 const IslandArt({super.key,this.size=100,this.variant=0});
 @override Widget build(BuildContext context)=>SizedBox(width:size,height:size,child:CustomPaint(painter:_IslandPainter(variant)));
}
class _IslandPainter extends CustomPainter {
 final int variant;_IslandPainter(this.variant);
 @override void paint(Canvas c,Size s){
  c.save();c.scale(s.width/120,s.height/100);
  final cloud=Paint()..color=Colors.white.withValues(alpha:.8);
  for(final x in [16.0,96.0]){c.drawOval(Rect.fromCenter(center:Offset(x,24),width:30,height:11),cloud);c.drawCircle(Offset(x-7,20),9,cloud);}
  final land=Path()..moveTo(8,53)..quadraticBezierTo(58,18,113,52)..quadraticBezierTo(70,80,8,53);
  c.drawPath(land,Paint()..color=const Color(0xFF50D98B));
  final base=Path()..moveTo(8,53)..quadraticBezierTo(60,76,113,52)..lineTo(68,94)..quadraticBezierTo(52,99,43,89)..close();
  c.drawPath(base,Paint()..color=const Color(0xFFB97C52));
  c.drawPath(Path()..moveTo(34,70)..lineTo(49,90)..lineTo(54,72)..close(),Paint()..color=const Color(0xFFE6A36E));
  c.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(42,24,37,29),const Radius.circular(7)),Paint()..color=variant%2==0?const Color(0xFFFFD15B):const Color(0xFFA8C9FF));
  c.drawPath(Path()..moveTo(36,27)..lineTo(61,9)..lineTo(85,27)..close(),Paint()..color=const Color(0xFFEA685E));
  c.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(55,35,12,18),const Radius.circular(5)),Paint()..color=const Color(0xFF5265A8));
  for(final x in [24.0,95.0]){c.drawRect(Rect.fromLTWH(x,33,4,21),Paint()..color=const Color(0xFF8B6D49));c.drawCircle(Offset(x+2,27),12,Paint()..color=const Color(0xFF21B977));}
  c.restore();
 }
 @override bool shouldRepaint(covariant _IslandPainter oldDelegate)=>variant!=oldDelegate.variant;
}
