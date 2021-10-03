import 'package:dtk_database_tekkom/buttontemplate.dart';
import 'package:dtk_database_tekkom/headerfooter.dart';
import 'package:dtk_database_tekkom/pagematkulsemester.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/loginpage.dart';
import 'package:dtk_database_tekkom/mainmenu.dart';

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
                      semester: "Semester 1", sks: 1, dest: PageMatkulSem()),
                  LongYellow(semester: "Semester 2", sks: 2, dest: LoginPage()),
                  LongYellow(semester: "Semester 3", sks: 3, dest: LoginPage()),
                  LongYellow(semester: "Semester 4", sks: 4, dest: LoginPage()),
                  LongYellow(semester: "Semester 5", sks: 5, dest: LoginPage()),
                  LongYellow(semester: "Semester 6", sks: 6, dest: LoginPage()),
                  LongYellow(semester: "Semester 7", sks: 7, dest: LoginPage()),
                  LongYellow(semester: "Semester 8", sks: 8, dest: LoginPage()),
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
