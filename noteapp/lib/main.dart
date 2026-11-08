import 'package:flutter/material.dart';
import 'package:noteapp/app/home.dart';

import 'app/auth/login.dart';
import 'app/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     initialRoute: "/signup",
      routes: {
        // "/" :(context)=> Login(),
        "/signup" :(context)=> Signup(),
        "/home" :(context)=> Home()
      },
    );
  }
}


