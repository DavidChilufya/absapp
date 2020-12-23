import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  static Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    FirebaseUser user = result.user;
    return user;
  }

  static Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  static Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  static Future<void> sendEmailVerification() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.sendEmailVerification();
  }

  static Future<bool> isEmailVerified() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    try {
      await user.reload();
    } catch (e) {
      return user.isEmailVerified;
    }
    user = await FirebaseAuth.instance.currentUser();
    return user.isEmailVerified;
  }

  static Future<void> resetPassword(email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}