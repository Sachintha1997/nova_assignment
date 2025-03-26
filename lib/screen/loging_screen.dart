import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:mind_engineering/screen/home.dart';
import 'package:mind_engineering/screen/register.dart';
import 'package:mind_engineering/screen/side_manu.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';
import 'package:mind_engineering/screen/ui_helper/font.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  CustomColors.white,

      //
      drawer: const AppDrawer(
        isLoggedIn: false,
        userName: null,
        userEmail: null,
      ),

      appBar: AppBar(
        backgroundColor:CustomColors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/images/ic_menu.png', width: 32, height: 32),
            onPressed: () {
              Scaffold.of(context).openDrawer(); 
            },
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/images/splash_logo.png', width: 100, height: 100),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: Customfont.libre,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Center(
                        child: Text(
                          "Log in to continue your happiness journey!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: Customfont.lato,
                            fontSize: 16,
                            color: CustomColors.subgry,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      buildTextField("Email Address", "name@gmail.com", _emailController, false, isEmail: true),
                      const SizedBox(height: 15),
                      buildPasswordField(),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: CustomColors.darkblue),
                          ),
                        ),
                      ),

                      const SizedBox(height: 200),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.buttonblue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
                          child: const Text("Login", style: TextStyle(fontFamily: Customfont.lato, fontSize: 16, color: CustomColors.white)),
                        ),
                      ),

                      const SizedBox(height: 15),

                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don’t have an account?",
                            style: const TextStyle(
                              fontFamily: "lato",
                              fontSize: 16,
                              color: CustomColors.darkblue,
                            ),
                            children: [
                              TextSpan(
                                text: "  Sign Up",
                                style: const TextStyle(
                                  fontFamily: "lato",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.darkblue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String hintText, TextEditingController controller, bool isPassword,
      {bool isEmail = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: "lato",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          style: const TextStyle(
              fontFamily: "lato", fontSize: 16, color: CustomColors.darkblue),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: "lato",
              fontSize: 16,
              color: CustomColors.hitegry,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(
              fontFamily: "lato",
              fontSize: 14,
              color: CustomColors.errrred,
              fontWeight: FontWeight.bold,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label can't be empty";
            }
            if (isEmail &&
                !RegExp(r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+").hasMatch(value)) {
              return "Invalid Email Address";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            fontFamily: "lato",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          style: const TextStyle(
            fontFamily: "lato",
            fontSize: 18,
            color: CustomColors.darkblue,
          ),
          decoration: InputDecoration(
            hintText: "Enter your password here",
            hintStyle: const TextStyle(
              fontFamily: "lato",
              fontSize: 16,
              color: CustomColors.hitegry,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(
              fontFamily: "lato",
              fontSize: 14,
              color: CustomColors.errrred,
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Image.asset(
                _isPasswordVisible
                    ? 'assets/images/ic_eye_open.png'
                    : 'assets/images/ic_eye_closer.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password can't be empty";
            } else if (value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
}
