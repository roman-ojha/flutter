import 'package:blocconcepts/constants/enum.dart';
import 'package:blocconcepts/logic/cubit/internet_cubit.dart';
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
  Widget build(BuildContext context) {
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
                builder: (context, state) {
              // now here we will also add a blocBuilder which will build the text according to the current internet state
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
              // if internet is loading
            }),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
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
                Navigator.of(context).pushNamed(
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
                Navigator.of(context).pushNamed(
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
