import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/my_icons_icons.dart';

import '../../../utils/screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Screen(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Image.asset('assets/images/2.png')),
            Stack(
              children: [
                const Center(
                  child: Text(
                    "La Vie",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Meddon"),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/1.png',
                    width: 23,
                    height: 15.04,
                  ),
                  heightFactor: 2.5,
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Screen.screenWidth / (428 / 45)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Screen.screenHeight / (926 / 55)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      color: AppColors.signupLoginText,
                                      offset: Offset(0, -15))
                                ],
                                color: Colors.transparent,
                                decorationThickness: 4,
                              ),
                            ),
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                      color: AppColors.primary,
                                      offset: Offset(0, -15))
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primary,
                                decorationThickness: 4,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email',
                                style:
                                    TextStyle(color: AppColors.textFieldLabel)),
                            const SizedBox(height: 3),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                              ),
                              validator: (input) {
                                if (input!.isEmpty || !input.contains('@')) {
                                  return "Email Field is Required";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                // _authData['email'] = val!;
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: Screen.screenHeight / (926 / 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Password',
                                style:
                                    TextStyle(color: AppColors.textFieldLabel)),
                            const SizedBox(height: 3),
                            TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                              ),
                              validator: (input) {
                                if (input!.isEmpty || input.length < 5) {
                                  return "Password length must be greater than 5 characters";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                // _authData['password'] = val!;
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("Login"),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primary)),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Screen.screenHeight / (926 / 35)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/line.png',
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  "or continue with",
                                  style: TextStyle(color: AppColors.customGrey),
                                ),
                              ),
                              Image.asset(
                                'assets/images/line.png',
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Screen.screenHeight / (926 / 20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  MyIcons.google,
                                  color: Color(0xffF14336),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  MyIcons.facebook,
                                  color: Color(0xff337FFF),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/3.png')),
          ],
        ),
      ),
    );
  }
}
