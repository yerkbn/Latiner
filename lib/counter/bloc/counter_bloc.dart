import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // The information that will be stored inside CounterBloc
  int counterValue = 0;

  /// Here CounterValue passed to [super] constructor
  /// because when application first created
  /// [CounterValue(0)] will be send to UI as Initial value
  CounterBloc() : super(CounterValue(0));

  @override

  /// Event sened from UI will be handled here
  /// and as result will return specific state
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    // Here we detect ehich event was sended
    if (event is CounterIncrement) {
      if (this.counterValue >= 10) {
        /// [yield] is like return but it will be sended
        /// continuously till some event change return value
        yield CounterFull();
      } else {
        this.counterValue++;
        yield CounterValue(this.counterValue);
      }
    }
    if (event is CounterDecrement) {
      this.counterValue--;
      yield CounterValue(this.counterValue);
    }
  }
}
