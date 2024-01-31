import 'package:chat_app/pages/ui_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 220,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset('assets/logo.png'), // Replace with your app logo
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _email = value!;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _password = value!;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Login logic goes here
                          // Navigate to home page or show error message
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text('or'),
                    const SizedBox(height: 20.0),
                    SignInButton(
                      Buttons.Google,
                      text: 'Login with Google',
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? googleUser =
                              await _googleSignIn.signIn();

                          final GoogleSignInAuthentication? googleAuth =
                              await googleUser?.authentication;
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleAuth?.accessToken,
                            idToken: googleAuth?.idToken,
                          );

                          final UserCredential userCredential =
                              await _auth.signInWithCredential(credential);
                          final User? user = userCredential.user;

                          // Check if sign-in was successful
                          if (user != null) {
                            // Navigate to home page or display success message
                            print('User signed in successfully: ${user.email}');
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Uipage()));
                          } else {
                            // Handle sign-in failure
                            print('Sign in failed');
                          }
                        } catch (e) {
                          // Handle errors
                          print('Error: $e');
                        }
                      },
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      text: 'Login with Facebook',
                      onPressed: () {
                        // Facebook login logic
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
