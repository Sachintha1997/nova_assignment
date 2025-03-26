import 'package:flutter/material.dart';
import 'package:mind_engineering/screen/side_manu.dart';
import 'package:mind_engineering/screen/ui_helper/colors.dart';
import 'package:mind_engineering/screen/ui_helper/font.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backblue,
       drawer: AppDrawer(
        isLoggedIn: true,
        userName: "Hiran",
        userEmail: "hiran@example.com",
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
        backgroundColor: CustomColors.backblue,
        elevation: 0,
      
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset('assets/images/home_logo.png', width: 80),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: CustomColors.backblue,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Good Afternoon,\nHiran!",
                    style: TextStyle(fontFamily: Customfont.libre,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildQuickAccessButton("Library", "assets/images/library.png",),
                      _buildQuickAccessButton("Journal", "assets/images/journal.png"),
                      _buildQuickAccessButton("Programs", "assets/images/programs.png"),
                      _buildQuickAccessButton("Dashboard", "assets/images/dashboard.png"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildStatusCard("Live\nScore", 0.52, CustomColors.livegreen,),
                      const SizedBox(width: 10),
                      _buildStatusCard("Accuracy", 0.25, CustomColors.darkred),
                    ],
                  ),
                ],
              ),
            ),

            
            Container(
              color: CustomColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _mindMandalaCard(),
                  const SizedBox(height: 10),
                  _awarenessLotusCard(),
                  const SizedBox(height: 10),
                  _mandalaAlignmentCard(),
                  const SizedBox(height: 20),
                  const Text(
                    "Popular Library",
                    style: TextStyle(fontFamily: Customfont.lato,fontSize: 16,color:CustomColors.subgry),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildLibraryCard("assets/images/focus.png"),
                        _buildLibraryCard("assets/images/happiness.png"),
                        _buildLibraryCard("assets/images/focus.png"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProgressCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessButton(String label, String assetPath) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color:CustomColors.bordblue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(assetPath, width: 32, height: 32, color: CustomColors.white),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  
  Widget _buildStatusCard(String title, double percent, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:CustomColors.bordblue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  CustomColors.white),
            ),
            CircularPercentIndicator(
              radius: 22.0,
              lineWidth: 5.0,
              percent: percent,
              center: Text("${(percent * 100).toInt()}%", style: const TextStyle(color:  CustomColors.white)),
              progressColor: color,
              backgroundColor:  CustomColors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _mindMandalaCard() {
   
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CustomColors.yelloorange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mandala Alignment",
                style: TextStyle(
                  fontFamily: Customfont.lato,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.darkblue,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color:  CustomColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "My Mind Mandala",
                   style: TextStyle(
                  fontFamily: Customfont.lato,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:CustomColors.darkblue,
                ),
                ),
              ),
            ],
          ),
          Image.asset("assets/images/mandala_bg.png", width: 150, height: 95),
        ],
      ),
    );
  }
  

  Widget _awarenessLotusCard() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CustomColors.disblue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/lotus_bg.png", width: 94, height: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Awareness Lotus",
                style: TextStyle(
                  fontFamily: Customfont.lato,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  CustomColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color:  CustomColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Start Meditation",
                  style: TextStyle(
                  fontFamily: Customfont.lato,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:CustomColors.darkblue,
                ),),
                ),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _mandalaAlignmentCard() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CustomColors.buttonblue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mandala Alignment",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:  CustomColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Mandala Alignment",
                   style: TextStyle(
                  fontFamily: Customfont.lato,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color:CustomColors.darkblue,
                ),
                ),
              ),
            ],
          ),
          Image.asset("assets/images/alignment_bg.png", width: 90, height: 90),
        ],
      ),
    );
  }


  
  Widget _buildLibraryCard(String image) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(image, height: 100),
    );
  }

 
Widget _buildProgressCard() {
  return Container(
    width: double.infinity,
    height: 185,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: const DecorationImage(
        image: AssetImage("assets/images/progress.png"), 
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: Stack(
      children: [
        const Positioned(
          left: 0,
          top: 0,
          child: Text(
            "Progress",
            style: TextStyle(
              fontFamily: Customfont.lato,
              color:  CustomColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Positioned(
          right: 0,
          top: 0,
          child: Text(
            "View More",
            style: TextStyle(
              color: CustomColors.white,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        
      ],
    ),
  );
}

}
