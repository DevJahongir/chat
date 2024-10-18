import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // registr method
  void register(BuildContext context) async {
    // get auth service
    final _auth = AuthService();

    // Check if passwords match
    if (_pwController.text == _confirmPwController.text) {
      try {
        // Attempt to register the user
        await _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } on FirebaseAuthException catch (e) {
        // Handle Firebase-specific error codes
        if (e.code == 'email-already-in-use') {
          // Show dialog for "email already in use"
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Email already in use!'),
              content: Text(
                'This email is already registered. Please use a different email or login instead.',
              ),
            ),
          );
        } else {
          // Handle any other Firebase exceptions
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Registration Failed'),
              content: Text(e.message ?? 'An unknown error occurred.'),
            ),
          );
        }
      } catch (e) {
        // Catch any other errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
          ),
        );
      }
    } else {
      // If passwords do not match, show an error dialog
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
          content: Text('Please make sure the passwords match.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(
              height: 50,
            ),

            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),

            SizedBox(
              height: 25,
            ),

            // email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
              focusNode: null,
            ),

            SizedBox(
              height: 10,
            ),

            //pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
              focusNode: null,
            ),

            SizedBox(
              height: 10,
            ),

            //pw textfield

            MyTextfield(
              hintText: "Confirm password",
              obscureText: true,
              controller: _confirmPwController,
              focusNode: null,
            ),

            SizedBox(
              height: 25,
            ),

            //login button
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),

            SizedBox(
              height: 25,
            ),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
