import 'package:dtk_database_tekkom/buttontemplate.dart';
import 'package:dtk_database_tekkom/mainmenu.dart';
import 'package:dtk_database_tekkom/signup.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/formtemplate.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nrpcontroller = TextEditingController(text: '');
    TextEditingController passwordcontroller = TextEditingController(text: '');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logotekkom.png',
              scale: 3,
            ),
            Text(
              "Selamat Datang\nAnak TK",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: StackContainer(
                  nrpcontroller: nrpcontroller,
                  passwordcontroller: passwordcontroller),
            )
          ],
        ),
      ),
    );
  }
}

class StackContainer extends StatelessWidget {
  final TextEditingController nrpcontroller;
  final TextEditingController passwordcontroller;

  StackContainer(
      {required this.nrpcontroller, required this.passwordcontroller});

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
            controller: nrpcontroller,
            hinttext: "NRP",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: passwordcontroller,
            hinttext: "Password",
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Text(
                "Doesn't Have Account?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Sign In Here",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white),
                  ))
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: LongButton(
                  hinttext: "Login", iconArrow: "Right", dest: MainMenu()))
        ],
      ),
    );
  }
}
