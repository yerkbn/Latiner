part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

// This will deliver counter value to the UI
class CounterValue extends CounterState {
  final int value; // this state will deliver this information to UI
  CounterValue(this.value);
  @override
  List<Object> get props => [value];
}

/// If value reache to 10 this state will
/// inform UI that counter reachet to the limit
class CounterFull extends CounterState {
  @override
  List<Object> get props => throw UnimplementedError();
}
