import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _MyHomeScreen();
}

class _MyHomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Increment"),
                duration: Duration(
                  microseconds: 200,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Decrement"),
                duration: Duration(
                  microseconds: 200,
                ),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'BRR, Negative' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAH' + state.counterValue.toString(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: "Decrement",
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).push(
                    // Here we are Routing through the Anonymous Routing
                    MaterialPageRoute(
                      builder: (newContext) => BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context),
                        // 'BlocProvider.value()' take the existing instance of bloc/cubit and provide it to further to next screen
                        // NOTE that we have to provide the 'context' to the 'BlocProvider' not the 'newContext'
                        child: const SecondScreen(
                          // now here we have to provide the 'blocProvider.value' to provide bloc/cubit instance to the Navigating screen
                          title: "Second Screen Anonymously",
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Go To Second Screen Anonymously",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  // routing using Name routing
                  Navigator.of(context).pushNamed("/second");
                },
                child: const Text(
                  "Go To Second Screen with Named Route",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text(
                  "Go To Third Screen with Named Route",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/generated');
                },
                child: const Text(
                  "Go To Home Screen with Generated Route",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second/generated');
                },
                child: const Text(
                  "Go To Second Screen with Generated Route",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third/generated');
                },
                child: const Text(
                  "Go To Third Screen with Generated Route",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
