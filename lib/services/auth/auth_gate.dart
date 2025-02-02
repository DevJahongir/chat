import 'package:chat_bot/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          // user is log in
          if(snapshot.hasData){
            return HomePage();
          }

          // user is Not logged in
          else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
