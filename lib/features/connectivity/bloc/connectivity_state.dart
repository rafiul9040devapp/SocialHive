part of 'connectivity_bloc.dart';

enum ConnectionStatus { initial, connected, disconnected }

final class ConnectivityState extends Equatable {
  final ConnectionStatus connectionStatus;
  final String? message;

  const ConnectivityState(
      {this.connectionStatus = ConnectionStatus.initial, this.message});

  ConnectivityState copyWith({
    ConnectionStatus? connection,
    String? message,
  }) {
    return ConnectivityState(
        connectionStatus: connection ?? connectionStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [connectionStatus, message];
}
