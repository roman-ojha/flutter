import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
// now here in CounterCubit firstly we have to set the initial state of the CounterCubit
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  // now we have to implement the 'increment' and 'decrement' which will emit counter state
  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  // you can access the current state byt 'state' keyword
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
