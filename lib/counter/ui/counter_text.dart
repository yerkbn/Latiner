import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latiner/counter/bloc/counter_bloc.dart';

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      /// [BlocListener] will be called once when state change
      listener: (BuildContext context, CounterState state) {
        if (state is CounterValue) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Counter is Working'),
            duration: Duration(milliseconds: 100),
          ));
        }
        if (state is CounterFull) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Counter Reach the Limit!!!'),
            duration: Duration(milliseconds: 100),
          ));
        }
      },
      bloc: BlocProvider.of<CounterBloc>(context),
      child: Center(

          /// [BlocBuilder] will be called Continously
          child: BlocBuilder<CounterBloc, CounterState>(

              /// [BlocProvider] will get the [CounterBloc] instance
              /// and give it to [BlocBuilder]
              bloc: BlocProvider.of<CounterBloc>(context),
              builder: (BuildContext context, CounterState state) {
                /// We check State type because onnly [CounterValue]
                /// have [value] field
                if (state is CounterValue) {
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headline1,
                  );
                }
                if (state is CounterFull) {
                  return Text(
                    'Counter reach limit',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              })),
    );
  }
}
