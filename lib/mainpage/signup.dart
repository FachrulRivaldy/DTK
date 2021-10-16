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
      resizeToAvoidBottomInset: false,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "DAFTAR AKUN",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Formnya(
            controller: newnamacontroller,
            hinttext: "Nama",
          ),
          Formnya(
            controller: newnrpcontroller,
            hinttext: "NRP",
          ),
          Formnya(
            controller: newemailcontroller,
            hinttext: "Email",
          ),
          Formnya(
            controller: newpasswordcontroller,
            hinttext: "Password",
          ),
          Formnya(
            controller: newangkatancontroller,
            hinttext: "Angkatan",
          ),
          Align(
            alignment: Alignment(-0.95, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                  child: Text(
                    "Upload Foto",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                UploadPhoto(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: LongButton(
              hinttext: "Sign Up",
              iconArrow: "Right",
              dest: LoginPage(),
              width: 105,
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
