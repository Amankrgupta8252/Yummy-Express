import 'package:flutter/material.dart';
import 'package:yemmy_food/screens/manu_page_after_login.dart';
import 'package:yemmy_food/screens/my_profile.dart';
import 'package:yemmy_food/screens/search_page.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  // List of items in the cart
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Burger',
      'price': 30,
      'quantity': 1,
      'image': 'assets/burger.png',
    },
    // Add more items as needed
  ];

  // Function to remove an item from the cart
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // Remove the item at the specified index
    });
  }

  // Function to increase or decrease the quantity of an item
  void _updateItemQuantity(int index, bool increment) {
    setState(() {
      if (increment) {
        cartItems[index]['quantity']++;
      } else {
        if (cartItems[index]['quantity'] > 1) {
          cartItems[index]['quantity']--;
        }
      }
    });
  }

  int _selectedIndex = 2;

  // Function to handle bottom navigation bar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the respective pages based on index
    if (index == 0) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ManuPageAfterLogin()),
      // );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddToCartPage()),
      );
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyProfile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 244, 212),
        elevation: 0,
        title: const Text('Add to Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        child: cartItems.isNotEmpty
            ? ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 158, 236, 232),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Image of the product
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Product details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${item['price']}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Quantity adjustment
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _updateItemQuantity(index, false);
                                      },
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                    ),
                                    Text('${item['quantity']}'),
                                    IconButton(
                                      onPressed: () {
                                        _updateItemQuantity(index, true);
                                      },
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Remove item button
                          IconButton(
                            onPressed: () {
                              _removeItem(index);
                            },
                            icon: const Icon(Icons.cancel,
                                color: Color.fromARGB(196, 236, 108, 96)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 40, 198, 193),
        unselectedItemColor: Colors.grey,
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
    );
  }
}
