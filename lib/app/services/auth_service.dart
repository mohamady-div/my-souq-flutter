import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_souq/app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_souq/app/screens/home_screen.dart';
import 'package:my_souq/components/declarations.dart';
import 'package:my_souq/components/error_handling.dart';
import 'package:my_souq/components/utils.dart';
import 'package:my_souq/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  void signUpUser(
      {required BuildContext context, required String email, required String password, required String name}) async {
    try {
      User user = User(id: '',
          name: name,
          password: password,
          address: '',
          type: '',
          token: '',
          email: email);

      http.Response res = await http.post(
          Uri.parse('$myUri01/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );

      httpErrorHandel(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account created, Now you are login");
          }
      );
    } catch (err) {
        showSnackBar(context, err.toString());
    }
  }

  void signInUser(
      {required BuildContext context, required String email, required String password}) async {
    try {

      http.Response res = await http.post(
          Uri.parse('$myUri01/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          }
      );

      httpErrorHandel(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await preferences.setString("my-souq-auth-token", jsonDecode(res.body)['token']);
            //showSnackBar(context, "Success you are welcome :)");
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
          }
      );
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}