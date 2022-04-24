import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocconcepts/constants/enum.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'internet_state.dart';

// after we successfully create the internet connectivity cubit we will access it to the './counter_cubit.dart'

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  // here 'connectivity' is the instance that will check the internet connectivity

// now we need stream subscription so that we will be able to subscribe to specific stream
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    // now here we can check the connectivity of the internet inside the constructor
    monitorInternetCubit();
  }

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      // NOTE that this function will get call every time internet connection get changed
      if (connectivityResult == ConnectivityResult.wifi) {
        // if the connectivity type is wifi then we will emit the internet connection and provide the type
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        // to mobile data
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.ethernet) {
        // to ethernet
        emitInternetConnected(ConnectionType.ethernet);
      } else if (connectivityResult == ConnectivityResult.none) {
        // if internet get disconnected
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));
  // emitInternetConnected function will take '_connectionType' and emit InternetConnected' with the same connection type

  void emitInternetDisconnected() => emit(InternetDisconnected());
  // this function will emit when internet get disconnected

// we don't want to listen internet connectivity for that we have to close it:
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
