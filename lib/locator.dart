import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sign_ease/services/authsService.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthProvider>(AuthProvider());
  locator.registerSingleton<AuthService>(AuthService());
}

class AuthProvider with ChangeNotifier {
  
}
