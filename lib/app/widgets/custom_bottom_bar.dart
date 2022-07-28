import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              index: 0
          ),
          getNavBottom(
            icon: Icons.person_outline_outlined,
            title: 'Account',
            index: 1
          ),
          getNavBottom(
              icon: Icons.shopping_cart_checkout,
              title: 'Cart',
              index: 2
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem getNavBottom({required IconData icon , required String title , required int index }) {

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
      child: Icon(icon),
    ),
        label: title
    );
  }
}
