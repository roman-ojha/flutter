import 'dart:developer';

import '../../constants/enum.dart';
import '../../logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;
  @override
  State<HomeScreen> createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<HomeScreen> {
  Widget build(BuildContext homeScreenContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (internetCubitContext, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return Text(
                  "Wi-Fi",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return Text(
                  "Mobile Data",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.ethernet) {
                return Text(
                  "Ethernet",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  "Disconnected",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (counterCubitContext, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(counterCubitContext).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(counterCubitContext).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            // Context.watch<>() ========================================================
            Builder(builder: (context) {
              // now here we will going to watch to different independent cubit state and whenever one cubit instance state change then we will rebuild the 'Builder' widget again
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;
              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobile) {
                return Text(
                  'counter: ' +
                      counterState.counterValue.toString() +
                      'internet: Mobile',
                  style: Theme.of(context).textTheme.headline6,
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return Text(
                  'counter: ' +
                      counterState.counterValue.toString() +
                      'internet: Wifi',
                  style: Theme.of(context).textTheme.headline6,
                );
              } else {
                return Text(
                  'counter: ' +
                      counterState.counterValue.toString() +
                      'internet: Disconnected',
                  style: Theme.of(context).textTheme.headline6,
                );
              }
            }),
            const SizedBox(
              height: 24,
            ),
            // Context.select() ================================================
            Builder(builder: (context) {
              final counterValue = context
                  .select((CounterCubit cubit) => cubit.state.counterValue);
              // here we will only rebuild the widget whenever the 'counterValue' value from the instance of state will going to change
              return Text(
                'counter: ${counterValue.toString()}',
                style: Theme.of(context).textTheme.headline6,
              );
            }),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // context.read() ===================================================
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    homeScreenContext.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    homeScreenContext.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.redAccent,
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(homeScreenContext).pushNamed(
                  '/second',
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: const Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(homeScreenContext).pushNamed(
                  '/third',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
