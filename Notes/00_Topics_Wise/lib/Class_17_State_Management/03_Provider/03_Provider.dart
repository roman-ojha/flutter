import 'dart:async';
import 'package:env/Class_17_State_Management/03_Provider/timer_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
  in the case of setState it will rendering the entire page every time which is the problem for the big application when the issued could be performance

  *) Provider:
      -> flutter pub add provider
      -> in provider we have 3 important part
          a) ChangeNotifierProvider:
            -> this create a instance of our data so if we want to change the value then we will get the instance of this provider
            -> as soon as the value change it notify all the consumer, once the consumer get the data we can update the widget accordingly without effecting any hierarchy
          b) Notifier
          c) Consumers

      -> Implementation:
          -> firstly we need the model which will hold the data, so we will going to create 'timer_info.dart' file for the model
          -> after creating modle we have to call notifier listener to do that we have to extend the class which we will implement in 'timer_info.dart'
          -> now we have to create the instance of a model
          -> now we have to see where this instance is needed only at that point we need to use notifier except that do not include somewhere else where this instance is not needed
          -> in this case we need to create it on a page level so we will create it no that level

*/

class ProviderStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        // ChangeNotifierProvider ===============================
        // Provide the instance to child level
        // NOTE: provide 'ChageNotiferProvider' where it will needed rather then providing of all of the widget hirearchy
        create: (BuildContext context) {
          // here we will not create a instance of timer info
          // if you want to initialized base on context then we can use it
          return TimerInfo();
        },
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      // Gettting the instance ===============================
      // now here we will get the instance of 'timer_info' that we have create here
      var _timerInfo = Provider.of<TimerInfo>(context, listen: false);
      // Provider.of<which_type_of_data_that_we_need>(context,<we_are_getting_the_instance_outside_visual_tree_,false_will_not_listen_for_the_fallback>)
      // now here we have a timerinfo instance with us
      _timerInfo.updateRemainingTime();
      // inside here we want to update the time
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderStateManagement'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          // now we are going to update or get the data only inside the Text widget we will going to wrap only text widget
          child: Consumer<TimerInfo>(
            // this consumer should know what type of data we are consuming
            builder: (context, data, child) {
              return Text(
                data.getRemainingTimer().toString(),
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
