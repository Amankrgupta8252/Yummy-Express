import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/order_process.dart';

class OrderDonePage extends StatelessWidget {
  const OrderDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            // "YUMMY EXPRESS" Title
            const Text(
              'YUMMY EXPRESS',
              style: TextStyle(
                fontSize: 32, // Larger font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Stack for the circular gradient background with the checkmark
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 180, // Increased size for better visual
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00BFFF), // DeepSkyBlue
                        Color(0xFF8A2BE2), // BlueViolet
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.check_circle,
                  size: 120, // Larger icon for better visibility
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Order Progress Button
            SizedBox(
              width: 250, // Fixed width for a centered button
              height: 50, // Button height for better touchability
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderProcess()),
                  );
                  // Action for order progress
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: const Text(
                  'Order Progress',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
