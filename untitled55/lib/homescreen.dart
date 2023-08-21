//Homescreen

import 'package:flutter/material.dart';
import 'list of products.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required Null Function() onHomeScreen});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _counter = 0;
  final List<Product> _products = [
    Product(name: 'Watch 1', price: 499.9),
    Product(name: 'Watch 2', price: 499.9),
    Product(name: 'Watch 3', price: 499.9),
    Product(name: 'Watch 4', price: 499.9),
    Product(name: 'Watch 5', price: 499.9),
    Product(name: 'Watch 6', price: 499.9),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigator Demo'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to the Home Screen',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text('Counter: $_counter', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        );
      case 1:
        return ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_products[index].name),
              subtitle: Text('Price: \$${_products[index].price}'),
            );
          },
        );
      case 2:
        return HomeScreen(
          onHomeScreen: () {
            // Account has been created or logged in, navigate back to home screen
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      default:
        return Container();
    }
  }
}




