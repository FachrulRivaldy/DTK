import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:dtk_database_tekkom/mainpage/signup.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';

import 'listener.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nrpcontroller = TextEditingController(text: '');
    TextEditingController passwordcontroller = TextEditingController(text: '');

    return Scaffold(
      resizeToAvoidBottomInset: false,
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

class StackContainer extends StatefulWidget {
  final TextEditingController nrpcontroller;
  final TextEditingController passwordcontroller;

  StackContainer(
      {required this.nrpcontroller, required this.passwordcontroller});

  @override
  _StackContainerState createState() => _StackContainerState();
}

class _StackContainerState extends State<StackContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      height: MediaQuery.of(context).size.height,
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
            controller: widget.nrpcontroller,
            hinttext: "NRP@its.ac.id",
          ),
          SizedBox(
            height: 15,
          ),
          Formnya(
            controller: widget.passwordcontroller,
            hinttext: "Password",
            isobscure: true,
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
              child: Container(
                alignment: Alignment.center,
                width: 105,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Login"),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                  onPressed: () async {
                    dynamic userlogin = await Authentication.signIn(
                        widget.nrpcontroller.text,
                        widget.passwordcontroller.text);

                    if (userlogin != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("ERROR CAN'T LOGIN")));
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
