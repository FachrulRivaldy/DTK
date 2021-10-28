import 'package:dtk_database_tekkom/mainpage/listener.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/mainpage/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MaterialApp(
        home: Scaffold(
          body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainMenu();
              } else {
                return LoginPage();
              }
            },
          ),
        ),
      ),
    ),
  );
}
