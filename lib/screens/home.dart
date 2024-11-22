import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/manu_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Navigate to the ManuPage after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ManuPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 244, 212),
              Color.fromARGB(255, 1, 58, 51),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header: Home Page (Top left)
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " ", // Empty for now
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 150, 150, 150),
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 1),

              // Circular food image
              CircleAvatar(
                radius: 200,
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                child: ClipOval(
                  child: Image.asset(
                    'assets/food_delivery.png',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 180,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // "YUMMY EXPRESS" Title
              const Text(
                "YUMMY EXPRESS",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cinzel',
                  color: Color.fromARGB(255, 86, 85, 85),
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
