
//products
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class items extends StatelessWidget {

  double quantity;

  String name;

  items( this.quantity, {super.key, required double price}) {
    // TODO: implement Product
    throw UnimplementedError();
  }
  final List<items> products = [
    items( 'Watch 1' as double, price: 499.9),
    items( 'Watch 2' as double, price: 499.9),
    items( 'Watch 3' as double, price: 499.9),
    items( 'Watch 4' as double, price: 499.9),
    items( 'Watch 5' as double, price: 499.9),
    items( 'Watch 6' as double, price: 499.9),

  ];

  get price => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Counter',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Counter'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductTile(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final items product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('Quantity: ${product.quantity}'),
      trailing: CounterWidget(product: product),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final items product;

  const CounterWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (product.quantity > 0) {
              product.quantity--;
            }
          },
        ),
        Text(product.quantity.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            product.quantity++;
          },
        ),
      ],
    );
  }
}
