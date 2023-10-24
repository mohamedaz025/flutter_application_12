// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_12/main.dart';

class CardWedget extends StatelessWidget {
  final String mytitle;
  final String person;
  final Function deletecard;
  final BestQuotes itmecard;     //   تعيرف عنصر وقعل قيمته اسم الكلاس التي نعرف فيها الليست
  const CardWedget({super.key, required this.mytitle,required this.itmecard,required this.deletecard, required this.person});
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      margin: EdgeInsets.all(25),
      color: Colors.amber,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mytitle,
              style: TextStyle(fontSize: 26),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deletecard(itmecard);
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 27,
                ),
                Text(
                  person,
                  style: TextStyle(fontSize: 19),
                  textDirection: TextDirection.rtl,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
