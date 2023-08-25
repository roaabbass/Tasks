
import 'package:flutter/material.dart';
import 'package:untitled55/overall_data/model/Product_data.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            image: DecorationImage(
              image: NetworkImage(
                product.thumbnail,
              ),
              fit: BoxFit.cover,
            ),
          ),
          margin: const EdgeInsets.all(10),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              height: 75,
              width: 150,
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Text(
                product.description,
                style: const TextStyle(color: Colors.white),
              )),
        ),
        Positioned(
          left: 60,
          right: 0,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: (product.price < 500) ? Colors.yellow : Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              product.price.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
