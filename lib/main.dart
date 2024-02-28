import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/onboarding.dart';
import 'home.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot Seek App',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor, 
        fontFamily: 'Gabriela', // Use your custom font family here
      ),debugShowCheckedModeBanner: false,
      home:const  HomePage(),
    );
  }
}
