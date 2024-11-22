import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/add_to_card.dart';
import 'package:yemmy_food/screens/manu_page.dart';
import 'package:yemmy_food/screens/my_profile.dart';
import 'package:yemmy_food/screens/order_detail.dart';
import 'package:yemmy_food/screens/place_order_page.dart';
import 'package:yemmy_food/screens/update_page.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Food Detail'),
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const MYProfileIn(),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 125, 33, 33)
                          .withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/burger.png'),
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Burger',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                            Text(" Like "),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    const Text(
                      '₹30.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 241, 214, 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Title:- Juicy Burgers – A Feast of Flavors',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Enjoy the perfect blend of juicy patties, fresh veggies, and soft toasted buns. Whether it’s the classic cheeseburger or a spicy twist, our burgers are crafted to delight your taste buds.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Top Picks:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '🍔 Classic Cheeseburger – Melted cheese and juicy perfection.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(
                      '🌶️ Spicy Chicken Burger – Crispy and fiery.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                      ),
                    ),
                    Text(
                      '🌱 Veggie Delight – Fresh and wholesome.\n',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[900],
                      ),
                    ),
                    const SizedBox(height: 08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 148, 205, 252),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child:
                              _buildAddOnItem('assets/chaumin.png', 'Chaumin'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 134, 246, 138),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: _buildAddOnItem('assets/samosa.png', 'Samosa'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 249, 202, 132),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: _buildAddOnItem(
                              'assets/manchurian.png', 'Manchuriyan'),
                        ),
                      ],
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centers the buttons horizontally
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddToCartPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 10, 239, 205),
                              ),
                              child: const Text('Add to Cart'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PlaceOrderPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 239, 75, 10),
                              ),
                              child: const Text('Buy Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddOnItem(String imagePath, String name) {
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          height: 60,
          width: 60,
        ),
        const SizedBox(height: 4),
        Text(name),
      ],
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(15.0, 15.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class MYProfileIn extends StatelessWidget {
  const MYProfileIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(46, 0, 0, 0), // Transparent background
      body: Align(
        alignment: Alignment.centerRight, // Align content to the right
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.7, // Take 70% width of screen
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyProfile()),
                  );
                },
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/Aman.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'User Name: Username\n',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Name: Aman Kumar Gupta',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'ID: UserId',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Address: Address',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Contact No.: 1234567890\n',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to UpdatePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpdatePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Update',
                        style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to MenuPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManuPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text('LogOut',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to OrderDetail page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderDetail()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Order History',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
