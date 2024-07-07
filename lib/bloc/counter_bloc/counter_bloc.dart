
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterValue(count: 0, isChecked: false)) {
    on<Increment>(increment);
    on<Decrement>(decrement);
    on<ToggleCheckbox>(_toggleCheckbox);
  }
  increment(Increment event, Emitter emit) {
    final num = state as CounterValue;
    emit(CounterValue(count: num.count + 1, isChecked: num.isChecked));
  }

  decrement(Decrement event, Emitter emit) {
    final num = state as CounterValue;
    emit(CounterValue(count: num.count - 1, isChecked: num.isChecked));
  }

  _toggleCheckbox(ToggleCheckbox event, Emitter<CounterState> emit) {
    final currentState = state as CounterValue;
    emit(CounterValue(count: currentState.count, isChecked: event.isChecked));
  }
}
