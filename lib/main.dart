import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_ease/firebase_options.dart';
import 'package:sign_ease/locator.dart';
import 'package:sign_ease/screens/loginAndSigninScreens/loginPage.dart';
import 'package:sign_ease/screens/menuPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
