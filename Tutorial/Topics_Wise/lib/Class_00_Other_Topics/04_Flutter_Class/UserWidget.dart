import 'package:flutter/material.dart';

class ShowUser extends StatelessWidget {
  final String firstName;
  // final keyword because this value for tha particular instance will be final and will not going to change
  final String lastName;
  final int userID;

  ShowUser(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.userID})
      : super(key: key);
  // Widget based constructor to get the data

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Text("ID: ${userID.toString()}"),
        Text("FirstName: $firstName"),
        Text("LastName: $lastName")
      ]),
    );
  }
}
