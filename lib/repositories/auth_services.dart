import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authSerivceProvider = Provider<AuthService>((ref) {
  return AuthService(auth: FirebaseAuth.instance, googleSignIn: GoogleSignIn());
});

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;

  AuthService({
    required this.auth,
    required this.googleSignIn,
  });

  get currentUser => auth.currentUser;

// sign in with google function
  void signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
  }

//  sign in with email and password method
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // Handle errors
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // method for signout

  Future<void> signOut() async {
    await auth.signOut();
  }

  // void signInWithEmail( email, password ) async {
  //   final user = await auth.s

  // method to sign up users
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Sign up the user
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Dismiss the loading indicator
      Navigator.pop(context);

      // Navigate to the GetStarted page
      Navigator.pushReplacementNamed(context, '/getStarted');

      // Show success message
      //
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Account created successfully!'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Dismiss the loading indicator
      Navigator.pop(context);

      // Handle errors and show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message!),
        ),
      );

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  // }
}
