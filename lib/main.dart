// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_12/widgets/card.dart'; // أساس الكود

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

class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "Ali 7assan", title: " العقل السليم في البعد عن 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];

  delete(BestQuotes iiii) {
    //  فونكشون لعمل مسح للعنصر نعرق مدخل ونعطية قيمة الكلاس الخاص الليست
    setState(() {
      //  لعمل هوت ريفريش بعد تنفيذ الفونكشون
      AllQuotes.remove(iiii);
    });
  }

  add() {
    setState(() {
      AllQuotes.add(
        BestQuotes(author:mycontrollerhhh2.text ,title: mycontrollerhhh.text),
      );
    });
  }

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
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: mycontrollerhhh,
                      decoration: InputDecoration(hintText: "ADD new quote"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: mycontrollerhhh2,
                      decoration: InputDecoration(hintText: "ADD author"),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          add();
                          
                        },
                        child: Text("ADD")),
                  ],
                ),
              );
            },
            isScrollControlled: false,
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  هذا الكود يكرر الكلاس بعدد عناصر الليست
            ...AllQuotes.map((item) => CardWedget(
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
