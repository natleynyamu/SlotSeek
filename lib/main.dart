import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/get_started.dart';
import 'package:slot_seek/login.dart';
import 'package:slot_seek/parking.dart';
import 'package:slot_seek/sign_up.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

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
        fontFamily: 'StudioFeixenSansTRIAL', // Use your custom font family here
      ),debugShowCheckedModeBanner: false,
      home: const  LoginPage(),
    );
  }
}
