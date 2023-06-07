/*
  -> here we will see how to cache the online data and store it in our local device
  -> where firebase will automatically cache the data to use for the offline but here we are not going to use firebase so for that we will use other package to achive that feature 
  -> for that we will use nodejs, and expressjs to send the data from the backend and save that data into the cache

  -> here we will going to use some package:
      -> flutter pub add http hive 
      -> flutter pub add hive
      -> flutter pub add hive_flutter
      -> flutter pub add path_provider
      -> flutter pub add toast

  -> hive is the nosql database it store data in json formate

  -> to use hive we will first while running the application we will do this:
    -> void main() async {
        await Hive.initFlutter();
        runApp(MyApp());
      }
*/

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// importing hive database
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HiveDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box box;
  List data = [];
  Future openBox() async {
    // this function will open a hive box and that box is named as data
    var dir = await getApplicationDocumentsDirectory();
    // here we are using the 'path_provider' package to get the application documents directory
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  // getting all the data from the internet
  Future<bool> getAllData() async {
    /* this function will work according to flow:
      -> First user will open an app/screen
      -> if (internet Avilable):
          -> { Update Database }
        else:
          -> { Load From DB }

      -> When user Refresh:
      -> if (internet Avilable):
          -> { Update DB }
        else:
          -> { Show Error }
    */

    await openBox();
    // opening the box

    String url = 'http://10.0.2.2:8080/api/data';
    // getting data from this url
    try {
      var response = await http.get(Uri.parse(url));
      // after that we have to decode the data that we just have got
      var _jsonDecode = jsonDecode(response.body);

      // firstly we have to updage the data into the hive database
      await putData(_jsonDecode);
      // so here 'putData' will update the data that is comming from the internet
    } catch (SocketException) {
      // when user open the app if internet is not avilable
      print("No Internet");
    }

    // now we have to get the data from the database and show them
    var mymap = box.toMap().values.toList();
    // here we are getting the data and it will return the map of data so we have to get the values part and get that value into list
    if (mymap.isEmpty) {
      // if there is no data into the database
      data.add('empty');
    } else {
      data = mymap;
    }
    return Future.value(true);
  }

  Future putData(data) async {
    // this function will put the data into database
    await box.clear();
    // firstly we have to clear the box

    // insert data
    for (var d in data) {
      // here we are inserting the every object from the list of json object
      box.add(d);
    }
  }

  Future<void> updateData() async {
    // Function to update the data
    String url = 'http://10.0.2.2:8080/api/data';
    try {
      var response = await http.get(Uri.parse(url));
      var _jsonDecode = jsonDecode(response.body);
      await putData(_jsonDecode);
      setState(() {});
    } catch (SocketException) {
      Fluttertoast.showToast(
        msg: "No Internet",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hive Database"),
        ),
        body: Center(
          child: FutureBuilder(
              future: getAllData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // if the snapshot have the data
                  if (data.contains('empty')) {
                    // it means box doesn't have any data it's empty
                    return Text(
                      "No Data",
                      style: TextStyle(fontSize: 24.0),
                    );
                  } else {
                    // it have a list of value
                    return Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        Image(
                          image: NetworkImage(
                            'https://www.aihr.com/wp-content/uploads/Leadership-Development-Plan.jpg',
                          ),
                          height: 250.0,
                        ),
                        Expanded(
                          child: RefreshIndicator(
                            // this refresh indecator will use to update the data
                            onRefresh: updateData,
                            // 'upsateData' is the function which will call after we refresh
                            child: ListView.builder(
                              itemBuilder: (ctxt, index) {
                                return ListTile(
                                  title: Text(
                                    "${data[index]['name']}",
                                  ),
                                  trailing: Text(
                                    "${data[index]['marks']}",
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                );
                              },
                              itemCount: data.length,
                            ),
                          ),
                        )
                      ],
                    );
                  }
                } else {
                  // if the snapshot doesnot have the data
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
