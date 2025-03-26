import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';
import 'package:mind_engineering/screen/ui_helper/font.dart';

class AppDrawer extends StatelessWidget {
  final bool isLoggedIn;
  final String? userName;
  final String? userEmail;

  const AppDrawer({
    super.key,
    required this.isLoggedIn,
    this.userName,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/home_logo.png", height: 40),
            ),

            
            if (isLoggedIn && userName != null && userEmail != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userEmail!,
                      style: const TextStyle(fontFamily: Customfont.lato,fontSize: 14, color: CustomColors.manygry),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 12),

            
            
            _buildDrawerItem("assets/images/faq.png", "FAQ"),
            _buildDrawerItem("assets/images/testimonials.png", "Testimonials"),
            _buildDrawerItem("assets/images/privacy.png", "Privacy Policy"),

            if (isLoggedIn)
              _buildDrawerItem("assets/images/password.png", "Change Password"),

            _buildDrawerItem("assets/images/contact.png", "Contact Us"),
            _buildDrawerItem("assets/images/about.png", "About Us"),
            _buildDrawerItem("assets/images/logout.png", "Logout"),

            const Spacer(),

            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/meny.png", height: 200),
                  
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String imagePath, String title) {
    return ListTile(
      leading: Image.asset(imagePath, height: 24, width: 24),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: Customfont.lato,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: CustomColors.manygry, 
        ),
      ),
      onTap: () {
        
      },
    );
  }
}
