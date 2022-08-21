import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/add_products.dart';
import 'package:my_souq/app/screens/auth_screen.dart';
import 'package:my_souq/app/screens/home_screen.dart';
import 'package:my_souq/app/widgets/custom_bottom_bar.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {

  switch(routeSettings.name){
    case AuthScreen.routName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen()
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen()
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BottomBar()
      );
    case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddProduct()
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No data here :('),
            ),
          )
      );
  }
}