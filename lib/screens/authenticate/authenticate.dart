import 'package:firebasefluttter/screens/authenticate/register.dart';
import 'package:firebasefluttter/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showSignIn == true)
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
