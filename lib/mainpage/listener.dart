import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Authentication extends ChangeNotifier {
  static Future signIn(String email, String password) async {
    try {
      UserCredential authen = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User user = authen.user!;
      return user;
    } catch (error) {}
  }

  Stream<User> get user =>
      FirebaseAuth.instance.authStateChanges().map((event) => event!);
}
