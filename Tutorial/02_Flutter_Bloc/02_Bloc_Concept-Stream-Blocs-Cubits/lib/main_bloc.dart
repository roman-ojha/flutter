import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }
// instead of having precooked increment function we have an enum called 'CounterEvent' which will contain number of events

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // now these event can be entered as an input into this function

    // and now new increment/ decrement state will be yield into the output state stream
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
    throw UnimplementedError();
  }
}

void main(List<String> args) async {
  final bloc = CounterBloc();

  final streamSubscription = bloc.stream.listen(print);

  // whenever the new event dispatch we will call bloc.add(<event>)
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.decrement);

  await Future.delayed(Duration.zero);

  await streamSubscription.cancel();
  await bloc.close();
}
