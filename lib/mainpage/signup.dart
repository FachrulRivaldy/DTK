import 'package:dtk_database_tekkom/mainpage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newnrpcontroller = TextEditingController(text: '');
    TextEditingController newpasswordcontroller =
        TextEditingController(text: '');
    TextEditingController newnamacontroller = TextEditingController(text: '');

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
                      newpasswordcontroller: newpasswordcontroller,
                      newangkatancontroller: newangkatancontroller)),
            ],
          ),
        ),
      ),
    );
  }
}

class StackSignUp extends StatefulWidget {
  final TextEditingController newnrpcontroller;
  final TextEditingController newpasswordcontroller;
  final TextEditingController newnamacontroller;

  final TextEditingController newangkatancontroller;

  StackSignUp(
      {required this.newnamacontroller,
      required this.newnrpcontroller,
      required this.newpasswordcontroller,
      required this.newangkatancontroller});

  @override
  _StackSignUpState createState() => _StackSignUpState();
}

class _StackSignUpState extends State<StackSignUp> {
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
            controller: widget.newnamacontroller,
            hinttext: "Nama",
          ),
          Formnya(
            controller: widget.newnrpcontroller,
            hinttext: "Nrp@its.ac.id",
          ),
          Formnya(
            controller: widget.newpasswordcontroller,
            hinttext: "Password",
            isobscure: true,
          ),
          Formnya(
            controller: widget.newangkatancontroller,
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
                      Text("Sign Up"),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: widget.newnrpcontroller.text,
                        password: widget.newpasswordcontroller.text);

                    setState(() {});

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              )),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
