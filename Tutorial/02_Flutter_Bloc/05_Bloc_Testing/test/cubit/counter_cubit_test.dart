import 'package:blocconcepts/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

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
        () => {
              expect(counterCubit.state,
                  CounterState(counterValue: 0, wasIncremented: false))
            });
  });
}
