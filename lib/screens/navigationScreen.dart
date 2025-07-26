import 'package:flutter/material.dart';
import 'package:webingo_demo/screens/ChooseSeatsPage.dart';
import 'package:webingo_demo/screens/fitnessHomePage.dart';
import 'package:webingo_demo/screens/travelHomePage.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F1F7),
      appBar: AppBar(
        title: Text("Explore UI Designs", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            designCard(
              context,
              title: "💪 Daily Challenge Fitness",
              description: "Motivational fitness dashboard",
              image: "images/daily_challenge.png",
              color: Colors.orangeAccent,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FitnessHomePage())),
            ),
            designCard(
              context,
              title: "🏨 Glass Hotel Search",
              description: "Search bar with blurred glass effect",
              image: "images/tiny_home.jpg",
              color: Colors.indigo,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TravelHomePage())),
            ),
            designCard(
              context,
              title: "🎬 INOX Theater Seating",
              description: "Cinema-style seat selection layout",
              image: "images/balance.png", // Add your preview image
              color: Colors.deepPurpleAccent,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChooseSeatsPage())),
            ),
          ],
        ),
      ),
    );
  }

  Widget designCard(BuildContext context, {
    required String title,
    required String description,
    required String image,
    required Color color,
    required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.2), blurRadius: 12, offset: Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 8),
                    Text(description, style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 20),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
