import 'package:flutter/material.dart';
import 'package:new_project/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caffteaira mangment system',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(205, 92, 92, 1),
      ),
      home: const LoginScreen(),
    );
  }
}
