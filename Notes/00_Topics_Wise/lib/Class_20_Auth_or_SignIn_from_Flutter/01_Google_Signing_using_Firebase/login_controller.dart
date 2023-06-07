import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var _googleSignin = GoogleSignIn();
  // here 'googleAccount' will content the information about the user
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignin.signIn();
    // this 'signIn' method return "GoogleSignInAccount" which is the user data
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
    // this 'sigOut' function will logout the google account
  }
}
