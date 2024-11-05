part of 'tab_bloc.dart';

class TabEvent extends Equatable {
  final int tabIndex;
  const TabEvent(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}