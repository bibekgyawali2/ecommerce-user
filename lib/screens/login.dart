import 'package:ecommerceuser/controller/auth_controller.dart';
import 'package:ecommerceuser/cubits/auth_cubit/auth_cubit.dart';
import 'package:ecommerceuser/widgets/button.dart';
import 'package:ecommerceuser/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/firebase_constants.dart';
import 'bottomnavbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var controller = AuthController();
  changeScreen() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              customTextfeild('Email', emailController, false),
              const SizedBox(height: 20),
              customTextfeild('Password', passwordController, true),
              const SizedBox(height: 30),
              customButtton(
                  onPressed: () async {
                    await controller
                        .loginMethod(
                      email: emailController.text,
                      password: passwordController.text,
                    )
                        .then((value) {
                      if (value != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ),
                        );
                      }
                    });
                  },
                  title: 'LOGIN'),
              // const SizedBox(
              //   height: 20,
              // ),
              // customButtton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const SignUPScreen(),
              //       ),
              //     );
              //   },
              //   title: 'SignUp',
              // ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color(0xFF4285F4),
                  minimumSize: const Size(
                    double.infinity,
                    52,
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).googlelogin();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
