import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        print(user.displayName);
        Navigator.pushNamedAndRemoveUntil(
            context, '/beranda', (route) => false);
      }
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Text('INI SPLASH SCREEN'),
        ),
      ),
    );
  }
}
