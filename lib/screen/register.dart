import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/loging_screen.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';
import 'package:mind_engineering/screen/ui_helper/font.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 32,
          icon: Image.asset('assets/images/ic_menu.png', width: 32, height: 32), 
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    "Register",
                    style: TextStyle(
                        fontFamily: 'libare',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.darkblue),
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    "Create your account to enjoy a 30-day\nfree subscription.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: CustomColors.subgry, fontFamily: 'lato'),
                  ),
                ),
                const SizedBox(height: 42),

                buildTextField("First Name", "Enter your first name", _firstNameController, false),
                const SizedBox(height: 20),

                buildTextField("Last Name", "Enter your last name", _lastNameController, false),
                const SizedBox(height: 20),

                buildTextField("Email Address", "name@example.com", _emailController, false, isEmail: true),
                const SizedBox(height: 20),

               
                buildPasswordField(),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.buttonblue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Registration Successful!")),
                          );
                        }
                      },
                      child: const Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t have an account?",
                      style: const TextStyle(fontFamily: "lato", fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "  Sign In",
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
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildTextField(
    String label,
    String hintText,
    TextEditingController controller,
    bool isPassword, {
    bool isEmail = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: Customfont.lato, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontFamily: Customfont.lato, fontSize: 16, color: Colors.grey[500]),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(fontFamily: Customfont.lato,color: Colors.red, fontWeight: FontWeight.bold),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }
            if (isEmail && !RegExp(r"^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+").hasMatch(value)) {
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
        const Text("Password", style: TextStyle(fontFamily: Customfont.lato, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: "Enter your password",
            hintStyle: TextStyle(fontFamily: Customfont.lato, fontSize: 16, color: Colors.grey[500]),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(fontFamily: Customfont.lato,color: Colors.red, fontWeight: FontWeight.bold),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Image.asset(
                _isPasswordVisible ? 'assets/images/ic_eye_open.png' : 'assets/images/ic_eye_closer.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password is required";
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
