import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/silabus/pagematkulsemester.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';

class PageSemester extends StatelessWidget {
  const PageSemester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45), color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "DAFTAR SEMESTER",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  LongYellow(
                      semester: "Semester 1", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 2", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 3", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 4", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 5", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 6", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 7", sks: 18, dest: PageMatkulSem()),
                  LongYellow(
                      semester: "Semester 8", sks: 18, dest: PageMatkulSem()),
                ],
              ),
            ),
            PageSemesterBot()
          ],
        ),
      ),
    );
  }
}

class PageSemesterBot extends StatelessWidget {
  const PageSemesterBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Align(
        alignment: Alignment(-0.75, 0),
        child: Column(
          children: [
            LongButton(hinttext: "Back", iconArrow: "Left", dest: MainMenu())
          ],
        ),
      ),
    );
  }
}
