import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productImage;
  final int productId;
  final String productName;
  final double productPrice;

  ProductDetailPage({
    required this.productImage,
    required this.productId,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                productImage,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Product ID: $productId',
              style: TextStyle(fontSize: 16),
            ),
            // Add more product details here
          ],
        ),
      ),
    );
  }
}
