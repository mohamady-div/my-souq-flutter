import 'package:flutter/material.dart';
import 'package:my_souq/app/services/auth_service.dart';
import 'package:my_souq/components/declarations.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

enum AuthEnum {
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const String routName = '/auth-screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEnum _auth = AuthEnum.signup;
  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _emailTxt = TextEditingController();
  final TextEditingController _passwordTxt = TextEditingController();
  final TextEditingController _nameTxt = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTxt.dispose();
    _passwordTxt.dispose();
    _nameTxt.dispose();
  }

  void signUpUser() {
    authService.signUpUser(context: context,
        email: _emailTxt.text,
        password: _passwordTxt.text,
        name: _nameTxt.text);
  }

  void signInUser() {
    authService.signInUser(context: context,
        email: _emailTxt.text,
        password: _passwordTxt.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Declarations.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == AuthEnum.signup ? Declarations.backgroundColor : Declarations.greyBackgroundColor,
                title: const Text("New Customer", style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Radio(
                  activeColor: Declarations.secondaryColor,
                  value: AuthEnum.signup,
                  groupValue: _auth,
                  onChanged: (AuthEnum? val) {
                    setState(() {
                        _auth = val ?? AuthEnum.signup;
                    });
                  },
                ),
              ),
              if (_auth == AuthEnum.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Declarations.backgroundColor,
                  child: Form(
                      key: _signUpKey,
                      child: Column (
                          children: [
                            CustomText(controller: _nameTxt, hinTxt: 'fullName',),
                            const SizedBox(height: 10,),
                            CustomText(controller: _emailTxt, hinTxt: 'Email',),
                            const SizedBox(height: 10,),
                            CustomText(controller: _passwordTxt, hinTxt: 'password',),
                            const SizedBox(height: 10,),
                            CustomButton(text: "Sign Up" , onTap: () {
                              if (_signUpKey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                            )
                          ],
                      )
                  ),
                ),
              ListTile(
                tileColor: _auth == AuthEnum.signin ? Declarations.backgroundColor : Declarations.greyBackgroundColor,
                title: const Text("Have an account ?", style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Radio(
                  activeColor: Declarations.secondaryColor,
                  value: AuthEnum.signin,
                  groupValue: _auth,
                  onChanged: (AuthEnum? val) {
                    setState(() {
                      _auth = val ?? AuthEnum.signin;
                    });
                  },
                ),
              ),
              if (_auth == AuthEnum.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Declarations.backgroundColor,
                  child: Form(
                      key: _signInKey,
                      child: Column (
                        children: [
                          CustomText(controller: _emailTxt, hinTxt: 'Email',),
                          const SizedBox(height: 10,),
                          CustomText(controller: _passwordTxt, hinTxt: 'password',),
                          const SizedBox(height: 10,),
                          CustomButton(text: "Sign In" , onTap: () {
                            if (_signInKey.currentState!.validate()) {
                              signInUser();
                            }
                          }, )
                        ],
                      )
                  ),
                ),
            ],
          ),
        ),
      )
    );
  }
}
