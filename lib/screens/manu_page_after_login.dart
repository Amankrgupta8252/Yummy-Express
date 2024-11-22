import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemmy_food/screens/add_to_card.dart';
import 'package:yemmy_food/screens/food_detail.dart';
import 'package:yemmy_food/screens/my_profile.dart';
import 'package:yemmy_food/screens/offer_page.dart';
import 'package:yemmy_food/screens/search_page.dart';

class ManuPageAfterLogin extends StatefulWidget {
  const ManuPageAfterLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ManuPageAfterLoginState createState() => _ManuPageAfterLoginState();
}

class _ManuPageAfterLoginState extends State<ManuPageAfterLogin> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ManuPageAfterLogin()),
          //Handle manu navigation
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
        // Handle Search navigation
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddToCartPage()),
        );
        // Handle Cart navigation
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProfile()),
        );
        //Handle My Profile navigation
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        // title: const Text('Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SystemNavigator.pop();
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Track selected index
        iconSize: 28.0,
        selectedItemColor: const Color.fromARGB(255, 40, 198, 193),
        unselectedItemColor: const Color.fromARGB(255, 110, 73, 73),
        backgroundColor: const Color.fromARGB(255, 14, 216, 172),
        onTap: _onItemTapped, // Handle taps
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Horizontal padding only
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(height: 20),
              const OfferCard(),
              const SizedBox(height: 20),
              const Text(
                'Popular',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(child: PopularItemsGrid()),
            ],
          ),
        ),
      ),
    );
  }
}

// Search Bar Widget
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(196, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

// Offer Card Widget
class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to OfferPage when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OfferPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 97, 238, 221),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Offer \n",
                      style: TextStyle(
                          color: Color.fromARGB(255, 100, 30, 30),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0),
                    Text(
                      "Enjoy 20% off your first order ! Order now and savor delicious meals delivered to your doorstep.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 100, 30, 30),
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Image(image: AssetImage('assets/samosa.png'))
          ],
        ),
      ),
    );
  }
}

// Popular Items Grid Widget
class PopularItemsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Burger',
      'price': '30',
      'ret': '4.5',
      'icon': Icons.star,
      'image': 'assets/burger.png'
    },
    {
      'name': 'Manchurian',
      'price': '80',
      'ret': '4.0',
      'icon': Icons.star,
      'image': 'assets/manchurian.png'
    },
    {
      'name': 'Samosa',
      'price': '20',
      'ret': '3.8',
      'icon': Icons.star,
      'image': 'assets/samosa.png'
    },
    {
      'name': 'Idli',
      'price': '50',
      'ret': '4.2',
      'icon': Icons.star,
      'image': 'assets/idli.png'
    },
    {
      'name': 'chaumin',
      'price': '30',
      'ret': '4.5',
      'icon': Icons.star,
      'image': 'assets/chaumin.png'
    },
    {
      'name': 'Bhejroll',
      'price': '80',
      'ret': '4.0',
      'icon': Icons.star,
      'image': 'assets/BhejRol.png'
    },
    {
      'name': 'Pizza',
      'price': '20',
      'ret': '3.8',
      'icon': Icons.star,
      'image': 'assets/pizza.png'
    },
    {
      'name': 'VegThali',
      'price': '50',
      'ret': '4.2',
      'icon': Icons.star,
      'image': 'assets/veg_thali.png'
    },
    {
      'name': 'Dosa',
      'price': '50',
      'ret': '4.2',
      'icon': Icons.star,
      'image': 'assets/Dhossa.png'
    },
  ];

  PopularItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 15,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PopularItemCard(
          name: items[index]['name']!,
          price: items[index]['price']!,
          image: items[index]['image']!,
          icon: items[index]['icon']!,
          ret: items[index]['ret']!, // Correctly pass the rating
        );
      },
    );
  }
}

// Popular Item Card Widget
class PopularItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final IconData icon;
  final String ret;

  const PopularItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.icon,
    required this.ret, // Pass rating here
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page for all items
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FoodDetail(), // Pass the item name
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 97, 238, 221),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ret, // Display rating
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 105, 1, 1),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        icon, // Display star icon
                        size: 16,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹$price',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 105, 1, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
