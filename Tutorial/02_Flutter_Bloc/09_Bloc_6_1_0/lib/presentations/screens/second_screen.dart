import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _MySecondScreen();
}

class _MySecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
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
                    backgroundColor: widget.color,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                    backgroundColor: widget.color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
