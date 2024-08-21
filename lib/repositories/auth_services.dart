import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authSerivceProvider = Provider<AuthService>((ref) {
  return AuthService(auth: FirebaseAuth.instance, googleSignIn: GoogleSignIn());
});

class AuthService {
  FirebaseAuth auth;
  GoogleSignIn googleSignIn;

  AuthService({
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3228758858.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2298626596.
    required this.auth,
    required this.googleSignIn,
  });

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3926498630.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2261179851.
  void signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await auth.signInWithCredential(credential);
  }
}
