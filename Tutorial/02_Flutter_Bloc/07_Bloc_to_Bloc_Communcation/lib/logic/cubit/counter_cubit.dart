import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocconcepts/constants/enum.dart';
import 'package:blocconcepts/logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  // now we have to access the 'InternetCubit' state so that we can increment and decrement
  // for that we will create the 'InternetCubit' instance

  // inOrder for the counter cubit to communicated with the 'InternetCubit' we need to create the 'StreamSubscription'
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: false)) {
    monitorInternetConnection();
  }

  StreamSubscription<InternetState> monitorInternetConnection() {
// remember the bloc/cubit have its stream of state you can subscribe
// so whenEver the internet State will receive then we can do something in response
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          (internetState.connectionType == ConnectionType.wifi ||
              internetState.connectionType == ConnectionType.ethernet)) {
        // show now we will listen to the state change and check if the connection type is wifi or ethernet then we will increment
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        //  if connection type is mobile data then we will decrement
        decrement();
      } else if (internetState is InternetDisconnected) {
        // if internet is Disconnected then also we will decrement
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    // we again have to close the internet subscription
    return super.close();
  }
}
