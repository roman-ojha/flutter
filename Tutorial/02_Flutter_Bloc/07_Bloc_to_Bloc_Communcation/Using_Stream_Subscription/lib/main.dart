import 'package:blocconcepts/logic/cubit/counter_cubit.dart';
import 'package:blocconcepts/logic/cubit/internet_cubit.dart';
import 'package:blocconcepts/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity()));
}

/*
  -> now we had completed creating 'InternetCubit' class all we need to do now is to provide both 'InternetCubit' and 'CounterCubit' globally to our pages
  -> but the reality is that 'CounterCubit' is dependent on 'InternetCubit' and the 'InternetCubit' is also dependent on 'connectivity_plus' package
  -> in that case what we can do is to instantiate the object by following the order from least dependent one to most dependent one 
  -> so we know that our connectivity_plus plugin doesn't dependent on any other plugin we will create it at the first
*/

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  /*
  -> Tip:
    -> a good practice when you want to create the stand alone instance which doesn't depend on anything is to create is at the top in our case in MyApp class
    -> because of that bloc/cubit/repository can use there specific methods like 'BlocProvider', 'RepositoryProvider'  
  */

  const MyApp({key, required this.appRouter, required this.connectivity})
      : super(key: key);

  // @override
  // void dispose() {
  //   _appRouter.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // now here we will provide the MultiBloc
        BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              internetCubit: BlocProvider.of<InternetCubit>(context)),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateroute,
      ),
    );
  }
}
