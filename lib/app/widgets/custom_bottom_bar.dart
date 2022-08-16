import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/account_screen.dart';
import 'package:my_souq/app/screens/home_screen.dart';
import 'package:my_souq/components/declarations.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bar-home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page =0;
  double nbWidth = 42;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Page'),),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: Declarations.selectedNavBarColor,
        unselectedItemColor: Declarations.unselectedNavBarColor,
        backgroundColor: Declarations.backgroundColor,
        iconSize: 28,
        items: [
          getNavBottom(
              icon: Icons.home_outlined,
              title: 'Home',
              index: 0,
              ifCart: false
          ),
          getNavBottom(
            icon: Icons.person_outline_outlined,
            title: 'Account',
            index: 1,
            ifCart: false
          ),
          getNavBottom(
              icon: Icons.shopping_cart,
              title: 'Cart',
              index: 2,
              ifCart: true
          ),
        ],
        onTap: updatePage,
      ),
    );
  }

  BottomNavigationBarItem getNavBottom({required IconData icon , required String title , required int index, required bool ifCart }) {

    return BottomNavigationBarItem(icon: Container(
      width: nbWidth,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: _page == index
                    ? Declarations.selectedNavBarColor
                    : Declarations.backgroundColor,
                width: 5
            ),

          )
      ),
      child: ifCart
          ? Badge(elevation: 0, badgeContent: const Text('2'), badgeColor: Colors.red, child:Icon(icon),)
          : Icon(icon)
    ),
        label: title
    );
  }
}
