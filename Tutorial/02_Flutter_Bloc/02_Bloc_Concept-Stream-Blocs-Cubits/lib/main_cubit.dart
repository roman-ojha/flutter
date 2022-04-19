import 'package:bloc/bloc.dart';

// here we are declaring the cubit responsible for managing the counter feature of the app
class CounterCubit extends Cubit<int> {
  // we we can see we are setting default state of the counter to 0
  CounterCubit() : super(0);

  // and now we will create the increment and decrement function
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  // so when we will call this function the increment/decrement state will be emitted
}

void main(List<String> args) async {
  final cubit = CounterCubit();

  final streamSubscription = cubit.stream.listen(print);
  //! this subscribes to the cubit state stream and prints the state values emitted by it

  print(cubit.state);
  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.decrement();

  await Future.delayed(Duration.zero);
  //! we use this to not cancel the subscription immediately down here

  await streamSubscription.cancel();
  await cubit.close();
}
