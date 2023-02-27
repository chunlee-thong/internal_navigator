import 'package:flutter/material.dart';
import 'package:internal_navigator/src/product_detail_page.dart';
import 'package:skadi/skadi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final _navigatorKey = GlobalKey<NavigatorState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This appbar always persist")),
      drawer: const Drawer(),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const HomeScaffold());
        },
      ),
    );
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // _navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => const ProductDetailPage()));
          SkadiNavigator.push(context, const ProductDetailPage());
        },
        child: const Text("View detail"),
      ),
    );
  }
}
