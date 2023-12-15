import 'package:flutter/material.dart';
import 'package:sign_ease/locator.dart';
import 'package:sign_ease/screens/loginAndSigninScreens/SignUpPage.dart';
import 'package:sign_ease/services/authsService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: Colors.white.withOpacity(
                        0.5), // Opaklık değeri buradan ayarlanabilir
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 15, top: 45, bottom: 12),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        TextInputContainer(
                            controller: emailController,
                            hintText: "E-Mail",
                            icon: const Icon(Icons.person)),
                        const SizedBox(height: 15),
                        TextInputContainer(
                            controller: passwordController,
                            hintText: "Password",
                            icon: const Icon(Icons.lock)),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.85, 60),
                              backgroundColor: Colors.green),
                          onPressed: () {
                            locator.get<AuthService>().signIn(
                                  context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 15),

                        buildSignInButton("assets/images/google.png",
                            "Sign In With Google", () {}),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Text("Don't you have an account? Sign up"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildSignInButton(
      String imagePath, String label, VoidCallback onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          imagePath,
          width: 30.0,
          height: 30.0,
        ),
        label: Text(label),
      ),
    );
  }
}

class TextInputContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon icon;
  const TextInputContainer(
      {required this.controller,
      required this.hintText,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 60,
          child: TextFormField(
            controller: controller,
            validator: (val) =>
                val?.length == 0 ? "Please Enter $hintText" : null,
            onSaved: (newValue) => controller.text = newValue ?? " ",
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 243, 243, 243),
            ),
          ),
        )
      ],
    );
  }
}
