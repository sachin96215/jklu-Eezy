import 'package:flutter/material.dart';
import 'package:jklu_eezy/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKLU Eezy',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
