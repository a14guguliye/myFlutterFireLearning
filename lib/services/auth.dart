import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefluttter/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _userFromFireBaseUser(User? user) {
    return (user != null) ? Users(uid: user.uid.toString()) : null;
  }

  Stream<Users?> get user {
    return _auth.authStateChanges().map((user) => _userFromFireBaseUser(user));
  }

  //// signin anonymoysly
  Future signInAnonym() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      return _userFromFireBaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// signin emailpassword
  Future signInEmailPassword(String? email, String? password) async {
    if (email == null || password == null) {
      return null;
    }

    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFireBaseUser(user.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// /register

  ///signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
