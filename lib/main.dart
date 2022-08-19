import 'package:flutter/material.dart';
import 'package:my_souq/app/screens/auth_screen.dart';
import 'package:my_souq/app/services/auth_service.dart';
import 'package:my_souq/app/widgets/custom_bottom_bar.dart';
import 'package:my_souq/providers/user_provider.dart';
import 'package:my_souq/router.dart';
import 'package:provider/provider.dart';
import 'components/declarations.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp()
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Souq',
        theme: ThemeData(
            scaffoldBackgroundColor: Declarations.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: Declarations.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                    color: Colors.black
                )
            )
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider
            .of<UserProvider>(context)
            .user
            .token
            .isNotEmpty
            ? const BottomBar()
            : const AuthScreen()
    );
  }
}



