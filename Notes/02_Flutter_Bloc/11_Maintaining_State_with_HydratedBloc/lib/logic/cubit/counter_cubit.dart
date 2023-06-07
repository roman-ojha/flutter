import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  // for a bloc/cubit to become hydrated that is for the state of the bloc/cubit saved and retrieve from the storage we need to use the 'HydratedMixin' to the class
  // or we can also use 'HydratedCubit' or 'HydratedBloc'
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // here we will implement to convert data form Json formate which will store in storage
    // Called Every time the app needs stored data
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    //  here we will convert the data to the json formate so that we can store data to storage
    // Called for Every State
    return state.toMap();
  }
}
