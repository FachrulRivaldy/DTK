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
        height: 95,
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
    return Container(
      child: Column(
        children: [
          //PageSemesterTop(),
          Padding(
            padding: EdgeInsetsGeometry.infinity,
            child: ListView(
              children: [
                YellowButton(hinttext: "Semester 1", dest: LoginPage()),
                YellowButton(hinttext: "Semester 2", dest: LoginPage())
              ],
            ),
          )
        ],
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
