part of 'counter_cubit.dart';

class CounterState {
  // this class will be the blue print for all the possible state which will be emit by the Cubit
  int counterValue;
  bool wasIncremented;
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });
}
