import 'package:flutter/material.dart';
import 'package:skadi/skadi.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Pie"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SkadiNavigator.popAll(context);
          },
          child: const Text("GO Back"),
        ),
      ),
    );
  }
}
