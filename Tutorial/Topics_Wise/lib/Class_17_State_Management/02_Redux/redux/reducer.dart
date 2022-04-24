import 'actions.dart';
import 'app_state.dart';

/*
  -> reducer function is the basic function that return the app state or as state and has a name 
*/

AppState updateDrinksReducer(AppState state, dynamic action) {
  // here this reducer function recive the state and action as an argunemt
  if (action is UpdateDrinkAction) {
    // here we will check if 'UpdateDrinkAction' has been triggured then we will use this reducer
    return AppState(
      // now here we will return the new state
      drinks: state.drinks
          .map(
            (drink) => drink.name == action.updatedDrink.name
                // here we are checking, only change that state which we have been modefied or update otherwise just return the same state
                ? action.updatedDrink
                : drink,
          )
          .toList(),
    );
  }

  return state;
}
