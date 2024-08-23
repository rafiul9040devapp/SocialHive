part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable{
  const ConnectivityEvent();
  @override
  List<Object?> get props => [];
}

final class ConnectivityChangeEvent extends ConnectivityEvent{
  final ConnectivityResult connectivityResult;
  const ConnectivityChangeEvent({required this.connectivityResult});

  @override
  List<Object?> get props => [connectivityResult];
}