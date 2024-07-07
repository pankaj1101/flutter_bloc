part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
  @override
  List<Object> get props => [];
}

class CounterValue extends CounterState {
  final int count;
  final bool isChecked;

  const CounterValue({required this.isChecked, required this.count});

  @override
  List<Object> get props => [count,isChecked];
}
