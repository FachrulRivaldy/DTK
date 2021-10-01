import 'package:flutter/material.dart';
//import 'package:dtk_database_tekkom/formtemplate.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
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
                height: 35,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                          topRight: Radius.circular(75))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
