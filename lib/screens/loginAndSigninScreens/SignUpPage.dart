import 'package:flutter/material.dart';
import 'package:sign_ease/locator.dart';
import 'package:sign_ease/screens/loginAndSigninScreens/loginPage.dart';
import 'package:sign_ease/services/authsService.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                    ),
                    color: Colors.white.withOpacity(
                        0.5), // Opaklık değeri buradan ayarlanabilir
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 30, left: 15, top: 45, bottom: 12),
                    child: Column(
                      children: [
                        TextInputContainer(
                            controller: nameController,
                            hintText: "Name",
                            icon: const Icon(Icons.person)),
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
                            locator.get<AuthService>().signUp(
                                  name: nameController.text,
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
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text("Already have you an account? Sign In"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
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
