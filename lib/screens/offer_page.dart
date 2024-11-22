import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/Offer_place_order.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Spacer added to move YUMMY EXPRESS up
              const Spacer(flex: 1),
              const Text(
                'YUMMY EXPRESS',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 5,
                ),
              ),
              const Spacer(flex: 1), // Add spacer after the title
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 150),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 144, 240, 236),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "This is for you only",
                            style: TextStyle(
                              fontFamily: 'Cursive',
                              fontSize: 18,
                              color: Color.fromARGB(255, 85, 7, 7),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildPriceRow('Edli', '50.00'),
                        _buildPriceRow('Dhosa', '70.00'),
                        const Divider(thickness: 2),
                        _buildPriceRow('Total', '120.00', isStriked: true),
                        _buildPriceRow('Only', '100.00', isBold: true),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/idli.png'),
                        const SizedBox(width: 10),
                        Image.asset('assets/Dhossa.png'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OfferPlaceOrder()),
                    );
                    // Handle order action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 250, 248, 248),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Order now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 61, 2, 2),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(String item, String price,
      {bool isStriked = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '₹$price',
            style: TextStyle(
              fontSize: 16,
              decoration:
                  isStriked ? TextDecoration.lineThrough : TextDecoration.none,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isStriked ? Colors.grey : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
