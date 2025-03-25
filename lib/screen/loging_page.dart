import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/loging_screen.dart';
import 'package:mind_engineering/screen/register.dart';
import 'package:mind_engineering/screen/side_manu.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const AppDrawer(
        isLoggedIn: false, 
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 32,
            icon: Image.asset('assets/images/ic_menu.png', width: 32, height: 32),
            onPressed: () {
              Scaffold.of(context).openDrawer(); 
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            width: 390,
            height: 442,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          const Text(
            "Welcome to Mind Engineers",
            style: TextStyle(fontFamily: "Libre", fontSize: 24, fontWeight: FontWeight.bold,color: CustomColors.darkblue),
          ),
          Text(
            "Your personal guide to happiness",
            style: TextStyle(fontFamily: "lato", fontSize: 16, color: CustomColors.welcomgry),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.buttonblue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontFamily: "lato", fontSize: 16, color: CustomColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "Don’t have an account?",
              style: const TextStyle(fontFamily: "lato", fontSize: 16, color: CustomColors.darkblue),
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
