import 'package:bloc_test/bloc_test.dart';
import 'package:blocconcepts/cubit/counter_cubit.dart';
import 'package:test/test.dart';

// NOTE: inside dart language two instances of exact same class are not equal, You can override this behavior using 'equatable'
// flutter pub add equatable
// now go to './lib/cubit/counter_cubit_state.dart' and extend class with equatable

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest(
      "the cubit should emit a CounterState(counterValue:1,wasIncremented:true) when cubit.increment() function is called",
      // test functionality of increment and decrement for that we will use 'blocTest', we will use this because we need to test output as a response to the increment and decrement function
      build: () => counterCubit,
      // 'build' is a function that will return the current instance of a counterCubit in order to make it available to the testing process
      // act: (cubit) => cubit.increment(),
      // 'act' is a function that will take cubit and return the action applied on it
      // expect: [CounterState(counterValue: 1, wasIncremented: true)],
      // 'expect' is an interval list which will verify if the order of the state and the actual emitting state correspond to the emitting once but with no other
    );

    blocTest(
      "the cubit should emit a CounterState(counterValue:-1,wasIncremented:false) when cubit.decrement() function is called",
      build: () => counterCubit,
      // act: (cubit) => cubit.decrement(),
      // expect: [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
