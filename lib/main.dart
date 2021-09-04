import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_majo/cubit/auth_cubit.dart';
import 'package:testcase_majo/pages/beranda_page.dart';
import 'package:testcase_majo/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testcase_majo/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/beranda': (context) => HomePage(),
        },
      ),
    );
  }
}
