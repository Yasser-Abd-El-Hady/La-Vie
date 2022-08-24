import 'package:flutter/material.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';

import '../../../utils/my_icons_icons.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Screen(context);
    var emailController;
    var passwordController;
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
                          const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    color: AppColors.primary,
                                    offset: Offset(0, -15))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                              decorationThickness: 4,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "Login",
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
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('First Name',
                                    style: TextStyle(
                                        color: AppColors.textFieldLabel)),
                                const SizedBox(height: 3),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (input) {
                                    if (input!.isEmpty) {
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
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Last Name',
                                    style: TextStyle(
                                        color: AppColors.textFieldLabel)),
                                const SizedBox(height: 3),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (input) {
                                    if (input!.isEmpty) {
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
                          )
                        ]),
                        SizedBox(height: Screen.screenHeight / (926 / 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email',
                                style:
                                    TextStyle(color: AppColors.textFieldLabel)),
                            const SizedBox(height: 2),
                            TextFormField(
                              controller: emailController,
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
                            const SizedBox(height: 2),
                            TextFormField(
                              controller: passwordController,
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
                        SizedBox(height: Screen.screenHeight / (926 / 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Confirm password',
                                style:
                                    TextStyle(color: AppColors.textFieldLabel)),
                            const SizedBox(height: 2),
                            TextFormField(
                              controller: passwordController,
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
                            child: const Text("Sign up"),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primary)),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Screen.screenHeight / (926 / 15)),
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
                              top: Screen.screenHeight / (926 / 5)),
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
