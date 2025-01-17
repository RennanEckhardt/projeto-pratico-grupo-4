import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((user) => (user != null) ? UserModel(id: user.uid) : null);
  }

  String get currenteUserUid {
    return _auth.currentUser.uid;
  }

  Future<String> singIn(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error $e');
    }
  }

  Future<void> singOut() {
    try {
      _auth.signOut();
    } catch (e) {
      print('Error $e');
    }
    return null;
  }
}
