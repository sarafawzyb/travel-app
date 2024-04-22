import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:travel_app/pages/signup_screen.dart';
import 'package:travel_app/pages/welcome_page.dart';

import '../theme/theme.dart';
import '../widget/custom_scaffold.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = '';

  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back, you have been missed!'.tr,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email'.tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Email'.tr),
                          errorText: errorMessage.contains('email')
                              ? errorMessage
                              : null,
                          hintText: 'Enter Email'.tr,
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        obscuringCharacter: '*'.tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password'.tr;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Password'.tr),
                          errorText: errorMessage.contains('password')
                              ? errorMessage
                              : null,
                          hintText: 'Enter Password'.tr,
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              Text(
                                'Remember me'.tr,
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget password?'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              Navigator.of(context)
                                  .pushReplacementNamed("homepage");
                            } catch (e) {
                              String errorMessage = 'An error occurred';
                              if (e is FirebaseAuthException) {
                                switch (e.code) {
                                  case 'user-not-found':
                                    errorMessage =
                                        'No user found for that email.';
                                    break;
                                  case 'wrong-password':
                                    errorMessage =
                                        'Wrong password provided for that user.';
                                    break;
                                  // Handle other FirebaseAuthException codes if needed
                                  default:
                                    errorMessage = e.message ?? errorMessage;
                                    break;
                                }
                              } else {
                                errorMessage =
                                    'An unexpected error occurred. Please try again later.';
                              }
                              print(errorMessage);
                              // Show dialog
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error Title',
                                desc: errorMessage,
                              ).show();
                            }
                          },
                          child: Text('Sign in'.tr),
                        ),
                      ),
                      // if (_formSignInKey.currentState!.validate() &&
                      //     rememberPassword) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //      content: Text('Processing Data'.tr),
                      //     ),
                      //   );
                      //   Get.to(const WelcomePage());
                      // } else if (!rememberPassword) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //      SnackBar(
                      //       content: Text(
                      //           'Please agree to the processing of personal data'.tr
                      //       ),
                      //     ),
                      //   );
                      // }
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with'.tr,
                              style: const TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            TeenyIcons.facebook,
                            color: Colors.blue,
                          ),
                          Icon(
                            TeenyIcons.twitter,
                            color: Colors.blue,
                          ),
                          Icon(
                            TeenyIcons.google,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?'.tr,
                            style: const TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
