import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/silabus/pagesemester.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/mainpage/loginpage.dart';

class PageMatkulSem extends StatelessWidget {
  const PageMatkulSem({Key? key}) : super(key: key);

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
                    "DAFTAR MATKUL SEMESTER 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  LongYellow(
                      semester: "Dasar Pemrograman", sks: 3, dest: LoginPage()),
                  LongYellow(
                      semester: "Pengantar Teknologi Elektro",
                      sks: 2,
                      dest: LoginPage()),
                  LongYellow(semester: "Fisika 1", sks: 4, dest: LoginPage()),
                  LongYellow(
                      semester: "Matematika 1", sks: 3, dest: LoginPage()),
                  LongYellow(
                      semester: "Bahasa Inggris", sks: 2, dest: LoginPage()),
                  LongYellow(semester: "Pancasila", sks: 2, dest: LoginPage()),
                  LongYellow(semester: "Agama", sks: 2, dest: LoginPage()),
                ],
              ),
            ),
            PageMatkulSemBot()
          ],
        ),
      ),
    );
  }
}

class PageMatkulSemBot extends StatelessWidget {
  const PageMatkulSemBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Align(
        alignment: Alignment(-0.75, 0),
        child: Column(
          children: [
            LongButton(
                hinttext: "Back", iconArrow: "Left", dest: PageSemester())
          ],
        ),
      ),
    );
  }
}
