import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/formtemplate.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/logotekkom.png',
                scale: 4,
              )
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
            controller: newnrpcontroller,
            hinttext: "NRP",
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
          )
        ],
      ),
    );
  }
}
