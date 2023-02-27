import 'package:flutter/material.dart';
import 'package:internal_navigator/src/app_controller.dart';
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
        title: Text(appController.product),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SkadiNavigator.push(context, const CheckOutPage());
          },
          child: const Text("Checkout"),
        ),
      ),
    );
  }
}

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  SkadiUtils.unsplashImage(width: 200, category: appController.product),
                ),
              ),
              title: Text(appController.product),
              trailing: const Text("X 1"),
              subtitle: const Text("\$ 300.00"),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: SkadiDecoration.radius(),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total"),
                  Text("\$ 300.00"),
                ],
              ),
            ),
            SkadiAsyncButton(
              startIcon: const Icon(Icons.payment),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(16),
              onPressed: () async {
                await SkadiUtils.wait();
                SkadiNavigator.popAll(context);
              },
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
