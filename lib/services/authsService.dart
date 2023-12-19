import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_ease/screens/menuPage.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(name: name, email: email, password: password);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MenuPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MenuPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _registerUser(
      {required String name,
      required String email,
      required String password}) async {
    await userCollection.doc().set({
      "name": name,
      "email": email,
      "password": password,
    });
  }

  Future<User?> signInWithGoogle() async {
    // oturum açma sürecini başlat
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();


    // süreç içersinde bilgi alma
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;


    // kullanıcı nesnesini alma 
    final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken,idToken: gAuth.idToken);


    // kullanıcı girişini sağla

    final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

    return userCredential.user;
  }
}
