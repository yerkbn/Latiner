import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latiner/counter/bloc/counter_bloc.dart';
import 'package:latiner/counter/ui/counter_text.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterPage();
  }
}

class _CounterPage extends State<CounterPage> {
  /// We create a instance of [CounterBloc] inside  [_CounterPage]
  final CounterBloc _counterBloc = CounterBloc();

  /// method [add] will call [mapEventToState] method inside a Bloc
  /// This is how Event from UI send to BLOC
  _increment() => _counterBloc.add(CounterIncrement());
  _decrement() => _counterBloc.add(CounterDecrement());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Limmited Counter App'),
          ),
          floatingActionButton: Container(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _decrement,
                  child: Icon(Icons.minimize),
                ),
                FloatingActionButton(
                  onPressed: _increment,
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),

          /// [BlocProvider] is used to send Bloc instance
          /// to childs, in other word we make them availible to
          /// all child by putting this code
          body: BlocProvider(
            create: (BuildContext context) => _counterBloc,
            child: CounterText(),
          )),
    );
  }
}
