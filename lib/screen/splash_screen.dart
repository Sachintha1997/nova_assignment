
import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/loging_page.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';
import 'package:mind_engineering/screen/ui_helper/font.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/images/splash_logo.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    'Powered By',
                    style: TextStyle(
                      fontFamily: Customfont.lato,
                      fontSize: 12,
                      color: CustomColors.neutralblue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Nova Solutions',
                    style: TextStyle(
                      fontFamily:Customfont.libre,
                      fontSize: 20,
                      color: CustomColors.darkblue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
