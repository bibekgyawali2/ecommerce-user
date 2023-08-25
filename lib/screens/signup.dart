import 'package:ecommerceuser/controller/auth_controller.dart';
import 'package:ecommerceuser/screens/bottomnavbar.dart';
import 'package:ecommerceuser/widgets/button.dart';
import 'package:ecommerceuser/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var controller = AuthController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              customTextfeild('Name', nameController, false),
              const SizedBox(height: 30),
              customTextfeild('Email', emailController, false),
              const SizedBox(height: 30),
              customTextfeild('Password', passwordController, true),
              const SizedBox(height: 30),
              const SizedBox(
                height: 20,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : customButtton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await controller
                                .signUpMethod(emailController.text,
                                    passwordController.text)
                                .then((value) {
                              return controller.storeUserData(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                              );
                            }).then((value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage(),
                                      ),
                                    ));
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            print(e);
                          }
                        }
                      },
                      title: 'SignUp',
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
