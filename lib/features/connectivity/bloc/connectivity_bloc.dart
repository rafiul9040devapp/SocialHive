import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityBloc({required Connectivity connectivity})
      : _connectivity = connectivity,
        super(const ConnectivityState()) {
    _initializeConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((connectivityResult) {
      add(ConnectivityChangeEvent(connectivityResult: connectivityResult));
    });

    on<ConnectivityChangeEvent>(_onConnectionChange);
  }

  Future<void> _initializeConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      add(ConnectivityChangeEvent(connectivityResult: connectivityResult));
    } catch (error) {
      add(const ConnectivityChangeEvent(connectivityResult: ConnectivityResult.none));
    }
  }

  FutureOr<void> _onConnectionChange(
      ConnectivityChangeEvent event, Emitter<ConnectivityState> emit) {
    if (event.connectivityResult == ConnectivityResult.none) {
      emit(state.copyWith(
          connection: ConnectionStatus.disconnected,
          message: 'No Internet Connection'));
    } else {
      emit(state.copyWith(
          connection: ConnectionStatus.connected,
          message: 'Internet Connection is Available'));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
