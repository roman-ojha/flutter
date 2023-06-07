// these are just a normal class or not a widget based class
class UserA {
  late String firstName;
  late String lastName;
  late int userID;

  UserA(String fName, String lName, int uid) {
    // one way to create constructor to assign value
    this.firstName = fName;
    this.lastName = lName;
    this.userID = uid;
  }
}

class UserB {
  String? firstName;
  String? lastName;
  int userID;

  UserB({String? fName, this.lastName, this.userID = 0}) {
    // this is the named parameter way to create constructor
    this.firstName = fName;
  }
}

class UserC {
  String firstName;
  String lastName;
  int userID;

  UserC(
      {required this.firstName, required this.lastName, required this.userID});
  // named parameter with required keyword
}
