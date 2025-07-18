import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static Future<UserCredential> firebaseSignUp(String email, String password) async {
    final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credentials;
  }
}