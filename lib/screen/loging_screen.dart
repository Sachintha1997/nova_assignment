import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/register.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/images/ic_menu.png', width: 32, height: 32), 
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
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
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  "Log in to continue your happiness journey!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              buildTextField("Email Address", "name@gmail.com", _emailController, false, isEmail: true),

              const SizedBox(height: 15),

          
              buildPasswordField(),

              const SizedBox(height: 10),

           
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.black)),
                ),
              ),

              const Spacer(),

             
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Successful!")),
                      );
                    }
                  },
                  child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 15),

             Center(
             child:  Text.rich(
                
  TextSpan(
    
    
    text: "Don’t have an account?",
    style: const TextStyle(fontFamily: "lato",fontSize: 16, color: Colors.black, ),
    children: [
      TextSpan(
        text: "  Sing Up",
        style: const TextStyle(
          fontFamily: "lato",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: CustomColors.darkblue,
        ),
        recognizer: TapGestureRecognizer()..onTap = () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen ()),
                );
                
         
        },
      ),
    ],
  ),
),

             ),
            SizedBox(height: 10),
            ],
          ),
          
        ),
      )
      ,
    );
  }

 
  Widget buildTextField(String label, String hintText, TextEditingController controller, bool isPassword, {bool isEmail = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label can't be empty";
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
        const Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextFormField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: "Enter your password here",
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
