import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  static Future<User> signIn(String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    User user = result.user;
    return user;
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<User> getCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser;
    return user;
  }

  static Future<void> sendEmailVerification() async {
    User user = await FirebaseAuth.instance.currentUser;
    return user.sendEmailVerification();
  }

  static Future<bool> isEmailVerified() async {
    User user = await FirebaseAuth.instance.currentUser;
    try {
      await user.reload();
    } catch (e) {
      return user.emailVerified;
    }
    user = await FirebaseAuth.instance.currentUser;
    return user.emailVerified;
  }

  static Future<void> resetPassword(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}