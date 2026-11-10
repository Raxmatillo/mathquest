import 'dart:math';

class LessonExercise {
  final String question, explanation, topic;
  final int answer;
  const LessonExercise(this.question,this.answer,this.explanation,this.topic);
}

/// Ten modules, 25 exercises each. Each module is split into 3 x 8 + 1 review.
LessonExercise exerciseFor(int id) {
  final m=id~/25, n=id%25;
  final a=3+(n*7+m*3)%18, b=2+(n*5+m)%9;
  final review=n==24;
  switch(m){
    case 0:
      const items=<List<Object>>[
        ['1, 2, 3, ?, 5',4,'Ketma-ketlikda har safar bittadan oshadi.'],
        ['7 dan keyin qaysi son keladi?',8,'7 ga 1 qo‘shamiz.'],
        ['10 dan oldingi son?',9,'10 dan 1 ayiramiz.'],
        ['5 va 8 orasidagi eng kichik butun son?',6,'6 va 7 orasida eng kichigi 6.'],
        ['3 + 2 = ?',5,'3 ta va 2 ta — jami 5 ta.'],
        ['9 − 4 = ?',5,'9 dan 4 ni ayirsak 5.'],
        ['12 sonining birliklar xonasidagi raqam?',2,'12 = 1 o‘nlik va 2 birlik.'],
        ['14 sonining o‘nliklar xonasidagi raqam?',1,'14 = 1 o‘nlik va 4 birlik.'],
        ['6, 8, 10, ?, 14',12,'Har safar 2 tadan oshadi.'],
        ['20 dan 1 ta kichik son?',19,'20 − 1 = 19.'],
        ['11 va 15 orasida nechta butun son bor?',3,'12, 13, 14 — jami 3 ta.'],
        ['16 sonining birliklar xonasidagi raqam?',6,'16 = 1 o‘nlik va 6 birlik.'],
        ['2 + 5 + 1 = ?',8,'Avval 2 + 5 = 7, keyin 1 qo‘shamiz.'],
        ['18 − 8 = ?',10,'18 dan 8 birlikni olib tashlaymiz.'],
        ['9 va 6 sonlaridan kattasi?',9,'9 soni 6 dan katta.'],
        ['4, 7, 10, ?, 16',13,'Har gal 3 tadan qo‘shiladi.'],
        ['25 sonida nechta o‘nlik bor?',2,'25 = 2 o‘nlik va 5 birlik.'],
        ['30 sonidan oldin qaysi son?',29,'30 − 1 = 29.'],
        ['17 + 2 = ?',19,'17 dan keyin ikki qadam sanaymiz.'],
        ['21 − 1 = ?',20,'21 dan bitta kam son 20.'],
        ['12, 14, 16, ?, 20',18,'Har safar 2 tadan oshadi.'],
        ['13 soniga 10 qo‘shing.',23,'13 + 10 = 23.'],
        ['28 dan 10 ayiring.',18,'28 − 10 = 18.'],
        ['19 va 21 orasidagi son?',20,'19 dan keyin 20 keladi.'],
        ['TAKRORLASH: 5 + 7 − 3 = ?',9,'5 + 7 = 12, 12 − 3 = 9.'],
      ];
      final row=items[n];return LessonExercise(row[0] as String,row[1] as int,row[2] as String,'Sonlar olami');
    case 1:
      final x=a+(n~/8)*10,y=b+(n%4);
      return LessonExercise('$x + $y = ?',x+y,'Birliklarni qo‘shamiz: $x + $y = ${x+y}.','Qo‘shish');
    case 2:
      final x=a+b+((n~/8)*10),y=b;
      return LessonExercise('$x − $y = ?',x-y,'$x dan $y ni ayirsak ${x-y} qoladi.','Ayirish');
    case 3:
      final x=2+n%9,y=2+(n*3)%8;
      return LessonExercise('$x × $y = ?',x*y,'$x ni $y marta olamiz: $x × $y = ${x*y}.','Ko‘paytirish');
    case 4:
      final x=2+n%9,y=2+(n*3)%8;
      return LessonExercise('${x*y} ÷ $y = ?',x,'${x*y} ni $y ta teng guruhga bo‘lsak har birida $x ta bo‘ladi.','Bo‘lish');
    case 5:
      final x=a+((n~/8)*10),y=n%2==0?x+b:x-b;
      if(n%3==0)return LessonExercise('$x va $y sonlaridan kichigi?',min(x,y),'Sonlar chizig‘ida chaproqda turgan son kichik.','Taqqoslash');
      return LessonExercise('$x va $y sonlaridan kattasi?',max(x,y),'Katta son sonlar chizig‘ida o‘ngroqda joylashadi.','Taqqoslash');
    case 6:
      const shapes=['Uchburchak','Kvadrat','To‘g‘ri to‘rtburchak','Beshburchak','Oltiburchak','Aylana'];
      const sides=[3,4,4,5,6,0];
      final k=(n*5)%6;
      if(n%3==0)return LessonExercise('${shapes[k]}ning nechta burchagi bor?',sides[k],'${shapes[k]}da ${sides[k]} ta burchak bor.','Geometrik shakllar');
      return LessonExercise('${shapes[k]}ning nechta tomoni bor?',sides[k],'${shapes[k]}da ${sides[k]} ta tomon bor.','Geometrik shakllar');
    case 7:
      final x=2+n%18;
      if(n%4==0)return LessonExercise('$x metr necha santimetr?',x*100,'1 metr = 100 santimetr. $x × 100 = ${x*100}.','O‘lchov birliklari');
      if(n%4==1)return LessonExercise('$x santimetr necha millimetr?',x*10,'1 santimetr = 10 millimetr.','O‘lchov birliklari');
      if(n%4==2)return LessonExercise('$x soat necha daqiqa?',x*60,'1 soat = 60 daqiqa.','O‘lchov birliklari');
      return LessonExercise('${x*10} millimetr necha santimetr?',x,'10 millimetr = 1 santimetr.','O‘lchov birliklari');
    case 8:
      final x=3+n%17,y=2+(n*7)%12;
      if(n%3==0)return LessonExercise('Azizada $x ta kitob bor edi. $y ta kitob oldi. Jami nechta?',x+y,'Jami sonni topish uchun qo‘shamiz: $x + $y = ${x+y}.','Matnli masalalar');
      if(n%3==1)return LessonExercise('Bog‘da ${x+y} ta olma bor. $y tasi terildi. Nechta qoldi?',x,'Qolganini topish uchun ayiramiz: ${x+y} − $y = $x.','Matnli masalalar');
      return LessonExercise('$x ta qutining har birida $y tadan qalam bor. Jami nechta?',x*y,'Teng guruhlar sonini ko‘paytiramiz: $x × $y = ${x*y}.','Matnli masalalar');
    default:
      if(n%4==0)return LessonExercise('$a, ${a+2}, ${a+4}, ? — davom ettiring.',a+6,'Har safar 2 tadan ortmoqda.','Mantiqiy fikrlash');
      if(n%4==1)return LessonExercise('$a, ${a+3}, ${a+6}, ? — davom ettiring.',a+9,'Har safar 3 tadan ortmoqda.','Mantiqiy fikrlash');
      if(n%4==2)return LessonExercise('2, 4, 8, 16, ? — davom ettiring.',32,'Har bir son 2 ga ko‘paytiriladi.','Mantiqiy fikrlash');
      return LessonExercise('1, 4, 9, 16, ? — davom ettiring.',25,'Bu 1², 2², 3², 4², 5² ketma-ketligi.','Mantiqiy fikrlash');
  }
}
