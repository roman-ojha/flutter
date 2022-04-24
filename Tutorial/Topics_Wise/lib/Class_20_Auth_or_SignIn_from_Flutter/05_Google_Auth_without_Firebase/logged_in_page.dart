import 'package:env/Class_20_Auth_or_SignIn_from_Flutter/05_Google_Auth_without_Firebase/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '05_Google_Auth_without_Firebase.dart';

class LoggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;
  const LoggedInPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('LoggedInPage'),
          actions: [
            TextButton(
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                // Logout user
                await GoogleSignInApi.logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GoogleAuthWithoutFirebase(),
                  ),
                );
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Name ${user.displayName}",
                style: TextStyle(fontSize: 20),
              ),
              Text("Email ${user.email}"),
            ],
          ),
        ),
      ),
    );
  }
}
