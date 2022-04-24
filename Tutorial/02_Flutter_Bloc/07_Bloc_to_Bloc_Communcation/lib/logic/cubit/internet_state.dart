part of 'internet_cubit.dart';

// because we have two connection type we will create enum
// because we these are the type that we hardly change in that case we will put these constant into constant folder

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {
  // Every bloc/cubit comes with the initial state this state emit when the bloc/cubit get's created

}

class InternetConnected extends InternetState {
// we would have internet connection state
  final ConnectionType connectionType;
  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {
// we would also have internet disconnection state
}
