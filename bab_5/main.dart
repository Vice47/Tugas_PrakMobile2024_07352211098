import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const HMTINewsApp());
}

class HMTINewsApp extends StatelessWidget {
  const HMTINewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HMTI News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}