part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}
/// When plus button pressed this event will be
/// send to Bloc in order to increment counter
class CounterIncrement extends CounterEvent {
  @override
  List<Object> get props => [];
}
/// When decrement button pressed this event will be
/// send to Bloc in order to decrement counter
class CounterDecrement extends CounterEvent {
  @override
  List<Object> get props => [];
}
