import 'package:firebasefluttter/models/user.dart';
import 'package:firebasefluttter/screens/authenticate/authenticate.dart';
import 'package:firebasefluttter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
