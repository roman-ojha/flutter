import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  // it return the "GoogleSignInAccount" as the user information

  static Future logout() => _googleSignIn.disconnect();
}
