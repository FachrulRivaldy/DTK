import 'package:dtk_database_tekkom/mainpage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController newnrpcontroller = TextEditingController(text: '');
    TextEditingController newpasswordcontroller =
        TextEditingController(text: '');
    TextEditingController newnamacontroller = TextEditingController(text: '');
    TextEditingController newemailcontroller = TextEditingController(text: '');
    TextEditingController newangkatancontroller =
        TextEditingController(text: '');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/logotekkom.png',
                scale: 4,
              ),
              Expanded(
                  child: StackSignUp(
                      newnamacontroller: newnamacontroller,
                      newnrpcontroller: newnrpcontroller,
                      newemailcontroller: newemailcontroller,
                      newpasswordcontroller: newpasswordcontroller,
                      newangkatancontroller: newangkatancontroller)),
            ],
          ),
        ),
      ),
    );
  }
}

class StackSignUp extends StatelessWidget {
  final TextEditingController newnrpcontroller;
  final TextEditingController newpasswordcontroller;
  final TextEditingController newnamacontroller;
  final TextEditingController newemailcontroller;
  final TextEditingController newangkatancontroller;

  StackSignUp(
      {required this.newnamacontroller,
      required this.newnrpcontroller,
      required this.newemailcontroller,
      required this.newpasswordcontroller,
      required this.newangkatancontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55), topRight: Radius.circular(55))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: newnamacontroller,
            hinttext: "Nama",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: newnrpcontroller,
            hinttext: "NRP",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: newemailcontroller,
            hinttext: "Email",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: newpasswordcontroller,
            hinttext: "Password",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: newangkatancontroller,
            hinttext: "Angkatan",
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70, left: 170),
            child: LongButton(
                hinttext: "Login", iconArrow: "Right", dest: LoginPage()),
          )
        ],
      ),
    );
  }
}
