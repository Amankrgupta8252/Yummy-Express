import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/feedback_page.dart';
import 'package:yemmy_food/screens/manu_page_after_login.dart';
import 'package:yemmy_food/screens/my_profile.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        title: const Text(
          'Your Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfile()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/Aman.jpg'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const OrderCard(
              imageUrl: 'assets/burger.png', // Burger Image
              title: 'Burger',
              price: 30,
              quantity: '1 piece',
              orderDate: 'Today 05:30 PM',
              paymentMethod: 'Google Pay',
            ),
            const SizedBox(height: 20),
            const OrderCard(
              imageUrl: 'assets/chaumin.png', // Noodles Image
              title: 'Noodles',
              price: 20,
              quantity: '1 piece',
              orderDate: '08/12/2023',
              paymentMethod: 'Cash',
            ),
            const SizedBox(height: 20),
            const OrderCard(
              imageUrl: 'assets/samosa.png', // Samosa Image
              title: 'Samosa',
              price: 20,
              quantity: '1 piece',
              orderDate: '08/12/2023',
              paymentMethod: 'Cash',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ManuPageAfterLogin()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 249, 250, 250),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String quantity;
  final String orderDate;
  final String paymentMethod;

  const OrderCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.orderDate,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 97, 238, 221),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 13, 13),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price : ₹$price',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 69, 67, 67), fontSize: 16),
                  ),
                  Text(
                    'Quantity : $quantity',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 69, 67, 67), fontSize: 16),
                  ),
                  Text(
                    'Order By : $paymentMethod',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 69, 67, 67), fontSize: 16),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  orderDate,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackPage()),
                    );
                  },
                  child: const Text(
                    'Feedback',
                    style: TextStyle(color: Color.fromARGB(255, 83, 84, 84)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
