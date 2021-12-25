import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/drink.dart';
import 'actions.dart';
import 'app_state.dart';
import '../widgets/drinks_widget.dart';
import '../constants.dart';

// Widget
class ReduxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: StoreConnector<AppState, List<Drink>>(
                // now the widget that want to update its state as soon something changes in the store then surround it by 'StoreConnector' it connects the store with the widget
                //StoreConnector<(usualStore), (What we want to return from our store is a list of 'Drink')>
                converter: (store) => store.state.drinks,
                // we are returning the 'store.state.drinks'
                // this converter will convert the appstate that we receive into whatever we want
                builder: (context, List<Drink> allDrinks) => Column(
                  // here we will have a builder function which will recive the context
                  // now here we can use the 'allDrinks' which contain all the list of drink
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ...allDrinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (value) {
                              drink.selected = !drink.selected;
                              // here we are reversing the bool value to update our state as the project
                              StoreProvider.of<AppState>(context).dispatch(
                                UpdateDrinkAction(drink),
                                // now here we have to dispatch the action where which action we want to triggured and that action takes 'drink' as the parameter
                              );
                            },
                          ),
                        )
                        .toList(),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            // and here we are displaying the all drinks from the list
                            allDrinks
                                .where((element) => element.selected)
                                .toList()[index]
                                .name,
                          ),
                        ),
                        itemCount: allDrinks
                            .where((element) => element.selected)
                            .length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
