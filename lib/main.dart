import 'package:flutter/material.dart';
import 'package:my_app/blocs/bloc_state.dart';
import 'package:my_app/blocs/users_bloc.dart';
import 'package:my_app/screens/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(BlocState())..add(LoadUsers()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}



/**
 * UI layer (Screens, components)
 * Bloc (Business logic component) layer
 * Data layer
 * Handlers layer (Services layer)
 */