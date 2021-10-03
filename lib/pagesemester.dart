import 'package:dtk_database_tekkom/buttontemplate.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/loginpage.dart';

class PageSemesterTop extends StatelessWidget {
  const PageSemesterTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(160),
            child: Image.asset('assets/images/logotekkom.png', scale: 8),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "MUHAMAMD FACHRUL RIVALDY",
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 75,
                  ),
                  Text(
                    "MAHASISWA",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Text(
                "07211940000032",
                style: TextStyle(fontSize: 11),
              ),
              Text(
                "SEMESTER 5",
                style: TextStyle(fontSize: 11),
              )
            ],
          )
        ]));
  }
}

class PageSemester extends StatelessWidget {
  const PageSemester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            PageSemesterTop(),
            Expanded(
              child: ListView(
                children: [
                  LongYellow(semester: "Semester 1", sks: 1, dest: LoginPage()),
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
    return Container();
  }
}
