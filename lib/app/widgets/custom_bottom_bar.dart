import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/account_screen.dart';
import 'package:my_souq/app/screens/cart_screen.dart';
import 'package:my_souq/app/screens/home_screen.dart';
import 'bottom_navigation_bar/bottom_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bar-home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double nbWidth = 42;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const Center(child: Text('Info'),)
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: CustomBottomNavigationBar(
        onIconPresedCallback: updatePage,
      ),
    );
  }
}
