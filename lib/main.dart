// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//  ربط صفحة اخري داخل المشروع
import 'package:flutter_application_12/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

//   عمل متغير للالاضافة بداخل الليست
class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  //  لسته لوضع المتغيرات داخلها
  List allQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "Ali 7assan", title: " العقل السليم في البعد عن 😂"),
  ];

  //  فونكشون لمسح الايتيم وجعل الكلاس يساوي متغير اخر
  delete(BestQuotes iiii) {
    setState(() {
      //  لعمل مسح للايتيم
      allQuotes.remove(iiii);
    });
  }

//  لعمل اضافة داخل الليست
  add() {
    setState(() {
      allQuotes.add(
        BestQuotes(author: mycontrollerhhh2.text, title: mycontrollerhhh.text),
      );
    });
  }

//   تعريف متغيرات مربوطه بمربع ادخال
  final mycontrollerhhh = TextEditingController();
  final mycontrollerhhh2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.brown,
        elevation: 10,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //    لعمل صفحة تفتح للمنتصف عند الضغط علي الزر العائم
          showModalBottomSheet(
            
            context: context,
            builder: (BuildContext context) {
              return Padding(
                
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  مربع للكتابة بداخلة
                    TextField(
                      //  ربط البينات المكتوبة بمتغير
                      controller: mycontrollerhhh,
                      decoration: InputDecoration(hintText: "ADD new quote"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //  مربع للكتابة بداخلة
                    TextField(
                      //  ربط البينات المكتوبة بمتغير
                      controller: mycontrollerhhh2,
                      decoration: InputDecoration(hintText: "ADD author"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //  لعمل كلمة للضغط عليها
                    TextButton(
                        onPressed: () {
                          //  امر قفل للصفحة الحالية
                          Navigator.pop(context);
                          //  استدعاء فنكشون الاضافة
                          add();
                        },
                        child: Text("ADD")),
                  ],
                ),
              );
            },
            // isScrollControlled: true,
            
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),



      body: 
      //  لعمل اسكرول علي حسب الكلوم او الرو
      SingleChildScrollView(
        child: Column(
          children: [
    //  هذا الكود يصنع تكرار للليست والودجت علي حسب عدد الايتيم
            ...allQuotes.map((item) => CardWedget(
                  // تعريف محتةي الكلاس المستخدم
                  itmecard: item,
                  deletecard: delete,
                  mytitle: item.title,
                  person: item.author,
                )).toList() //  الثلان نقاط لتدمير اقواس الشلدرن
          ],
        ),
      ),
    );
  }
}
