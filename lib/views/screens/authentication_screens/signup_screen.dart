import 'package:flutter/material.dart';
import 'package:la_vie/provider/authentication_provider.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/text_form_field.dart';
import 'package:la_vie/views/screens/main_screens/app_layout_screen.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../utils/my_icons_icons.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _lNameController = TextEditingController();
  final _fNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                                        builder: (context) => LoginScreen()));
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
                              child: textFormField(
                                  labelName: 'First Name',
                                  controller: _fNameController,
                                  keyboardType: TextInputType.name,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return "Required field";
                                    }
                                    return null;
                                  }),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              flex: 1,
                              child: textFormField(
                                  labelName: 'Last Name',
                                  controller: _lNameController,
                                  keyboardType: TextInputType.name,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return "Required field";
                                    }
                                    return null;
                                  }),
                            )
                          ]),
                          SizedBox(height: Screen.screenHeight / (926 / 10)),
                          textFormField(
                              labelName: 'Email',
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) {
                                if (input!.isEmpty || !input.contains('@')) {
                                  return "This field must be an email";
                                }
                                return null;
                              }),
                          SizedBox(height: Screen.screenHeight / (926 / 10)),
                          textFormField(
                              labelName: 'Password',
                              controller: _passwordController,
                              validator: (input) {
                                if (input!.isEmpty || input.length < 5) {
                                  return "Password is weak";
                                }
                                return null;
                              }),
                          SizedBox(height: Screen.screenHeight / (926 / 10)),
                          textFormField(
                              labelName: 'Confirm Password',
                              controller: _confirmPasswordController,
                              validator: (input) {
                                if (input != _passwordController.text) {
                                  return "Password not matched";
                                }
                                return null;
                              }),
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await Provider.of<Authentication>(context,
                                          listen: false)
                                      .signUp(
                                          fName: _fNameController.text,
                                          lName: _lNameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text)
                                      .then((value) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AppLayoutScreen()));
                                  }, onError: (e) {
                                    Toast.show(e.toString(), duration: 3);
                                  });
                                } else {
                                  return;
                                }
                              },
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    "or continue with",
                                    style:
                                        TextStyle(color: AppColors.customGrey),
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/line.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
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
      ),
    );
  }
}
