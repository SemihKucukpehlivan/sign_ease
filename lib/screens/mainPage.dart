import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.cover,
        ),
        Text(user.displayName!),
        Text(user.email!),
        CircleAvatar(
          child: Image.network(user.photoURL!),
        )
      ],
    );
  }
}
