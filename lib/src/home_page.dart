import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:internal_navigator/src/app_controller.dart';
import 'package:internal_navigator/src/product_detail_page.dart';
import 'package:skadi/skadi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final homeNavigatorKey = GlobalKey<NavigatorState>();
final profileNavigatorKey = GlobalKey<NavigatorState>();

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  ValueNotifier<int> page = ValueNotifier(0);

  @override
  void dispose() {
    pageController.dispose();
    page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (page.value == 2) {
          if (homeNavigatorKey.currentState!.canPop()) {
            homeNavigatorKey.currentState?.pop();
          } else {
            pageController.jumpToPage(0);
            page.value = 0;
          }
        } else {
          pageController.jumpToPage(0);
          page.value = 0;
        }

        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Welcome to Super App")),
        drawer: const Drawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: SkadiDecoration.radius(8),
                  ),
                  suffixIcon: const Icon(Icons.search),
                  hintText: "Search",
                ),
              ),
            ),
            PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Center(child: Text("Movie")),
                Center(child: Text("Trip")),
                HomeNavigator(),
                Center(child: Text("Profile")),
              ],
            ).expanded,
          ],
        ),
        bottomNavigationBar: page.builder(builder: (context, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: page.value,
            onTap: (value) {
              pageController.jumpToPage(value);
              page.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_outlined),
                label: "Movies",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.travel_explore),
                label: "Trips",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        }),
      ),
    );
  }
}

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: homeNavigatorKey,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const HomeScaffold());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        final food = Faker().food.dish();
        final amount = Faker().randomGenerator.integer(99);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              SkadiUtils.unsplashImage(
                width: 200 + index,
                category: food,
              ),
            ),
          ),
          title: Text(food),
          subtitle: Text("\$ $amount.00"),
          onTap: () {
            appController.setProduct(food);
            SkadiNavigator.push(context, const ProductDetailPage());
          },
        );
      },
    );
  }
}
