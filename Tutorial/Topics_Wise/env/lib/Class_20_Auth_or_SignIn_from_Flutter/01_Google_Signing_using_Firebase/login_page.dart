import 'package:env/Class_20_Auth_or_SignIn_from_Flutter/01_Google_Signing_using_Firebase/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // here we are referring the controller inside our login page
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Center(
        child: Obx(
          () {
            // obx is responsible for updating the widget if we have some observable variable inside it
            if (controller.googleAccount.value == null) {
              // it means that we haven't sign in yet or we don't have to data of the user yet
              return buildLoginButton();
            } else {
              return buildProfileView();
            }
          },
        ),
      ),
    );
  }

  Column buildProfileView() {
    // this is the profile view after login
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? '')
                  .image,
          radius: 100,
        ),
        Text(
          controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline3,
        ),
        // who the user name after logIn
        Text(
          controller.googleAccount.value?.email ?? "",
          style: Get.textTheme.bodyText1,
        ),
        SizedBox(
          height: 16,
        ),
        ActionChip(
          // now we will also create  the logout button to logout the user accout
          label: Text("Logout"),
          onPressed: () {
            controller.logout();
            // here we are logging out by calling 'logout()'
          },
          avatar: Icon(Icons.logout),
        )
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    // this is the login view when user is login in
    return FloatingActionButton.extended(
      onPressed: () {
        // GoogleSignIn().signIn();
        controller.login();
      },
      label: Text("Sign in with Google"),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      icon: Image.asset(
        'assets/images/google_icon.jpg',
        height: 32,
        width: 32,
      ),
    );
  }
}
