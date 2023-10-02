// import "package:flutter/material.dart";

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbutton.dart';
import 'package:onboarding_screen/component/my_textbutton.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);

      if (e.code == 'invalid-email') {
        print('No user found for that email.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signInUser() async {
    if (nameController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "" &&
        confirmpasswordController.text != "") {
      print("It's ok");
    } else {
      print("Please input your email and password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Form(
          child: Column(
            children: [
              const Spacer(),
              Text(
                "Hello, ready to get start?",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please sign up with your email and password.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: nameController,
                hintText: "Please input your name",
                obscureText: false,
                labelText: "Name",
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                hintText: "Please input your email",
                obscureText: false,
                labelText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: "Please input your password",
                obscureText: true,
                labelText: "Password",
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: confirmpasswordController,
                hintText: "Confirm your password",
                obscureText: true,
                labelText: "Confirm your password",
              ),
              const Spacer(),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  onTap: createUserWithEmailAndPassword, hintText: "Sign Up"),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(thickness: 0.5, color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or continue with",
                          style: TextStyle(color: Colors.grey.shade700)),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagePath: "assets/images/google_icon.png"),
                  SizedBox(
                    width: 10,
                  ),
                  MyIconButton(imagePath: "assets/images/apple_icon.png")
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Have an account?",
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const MyTextButton(
                      labelText: "Login now",
                      pageRoute: "login",
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
