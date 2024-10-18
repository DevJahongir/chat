import 'package:chat_bot/pages/login_page.dart';
import 'package:chat_bot/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, show login page
  bool showLoginPage = true;

  // togle between login and register page
  void toggleaPage(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTap: toggleaPage,
      );
    }else {
      return RegisterPage(
        onTap: toggleaPage,
      );
    }
  }
}
