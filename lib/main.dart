import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/formnya.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("COBA"),
        ),
      ),
    );
  }
}
