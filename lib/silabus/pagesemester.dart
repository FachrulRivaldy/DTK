import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/silabus/pagematkulsemester.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';

// ignore: must_be_immutable
class PageSemester extends StatelessWidget {
  String semester1 = 'Semester 1';
  String semester2 = 'Semester 2';
  String semester3 = 'Semester 3';
  String semester4 = 'Semester 4';
  String semester5 = 'Semester 5';
  String semester6 = 'Semester 6';
  String semester7 = 'Semester 7';
  String semester8 = 'Semester 8';

  int sks1 = 28;
  int sks2 = 18;
  int sks3 = 18;
  int sks4 = 18;
  int sks5 = 28;
  int sks6 = 47;
  int sks7 = 33;
  int sks8 = 12;

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
                    semester: semester1,
                    sks: sks1,
                    dest: PageMatkulSem(),
                    /*controller: ControlSemester.controlsem1*/
                  ),
                  LongYellow(
                      semester: semester2, sks: sks2, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester3, sks: sks3, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester4, sks: sks4, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester5, sks: sks5, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester6, sks: sks6, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester7, sks: sks7, dest: PageMatkulSem()),
                  LongYellow(
                      semester: semester8, sks: sks8, dest: PageMatkulSem()),
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
