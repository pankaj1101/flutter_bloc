part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class ToggleCheckbox extends CounterEvent {
  final bool isChecked;

  const ToggleCheckbox(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}
