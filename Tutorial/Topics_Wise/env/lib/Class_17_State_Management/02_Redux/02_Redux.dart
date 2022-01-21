/*
  -> https://github.com/dabit3/flutter-redux-example (for example to watch)
*/

/*
  -> Redux has three principle:
      1) Single source of truth
      2) State is immputable
      3) Pure Function change the state
  
  -> Redux consist of three important parts:
      1) Action
          -> this trigured the change of the state
      2) Reducer
          -> implementation that how the state will change
      3) Store:
          -> it contain the single source or truth

*/

/*
  -> firstly we need to install some dependencies:
      -> flutter pub add flutter_redux
      -> flutter pub add redux

  -> Now we have to create a AppState wight an empty List of Drinks which is in 'redux/app_state.dart'
*/

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'models/drink.dart';
import 'redux/app_state.dart';
import 'redux/reducer.dart';
import 'package:redux/redux.dart';
import 'redux/redux_screen.dart';

class FlutterRedux extends StatelessWidget {
  // here 'Store' is the final state of the applicaton that will contain all the state of the application which use redux
  final Store<AppState> _store = Store<AppState>(
    updateDrinksReducer,
    // here we have to put all the reducer that we had created in this application
    initialState: AppState(
      // here we have to set the initial state of the store
      drinks: [
        Drink("Water", false),
        Drink("Cuba Libre", false),
        Drink("Pina Colada", false),
        Drink("Havana Cola", false)
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: StoreProvider<AppState>(
        // here we have to surround our redux screen or the whole material app with a store provider widget which will provide all the state or store to the child widget
        store: _store,
        // and here we have to spacify the store which is our store that we had created
        child: ReduxScreen(),
      ),
    );
  }
}
