import 'package:flutter/material.dart';
import 'package:my_app/components/user_card.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/screens/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/users_bloc.dart';
import 'package:my_app/blocs/bloc_state.dart';

/*
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  HomeBloc homeBloc = HomeBloc(0);
  void _incrementCounter() {
    homeBloc.add(DecrementCounter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<HomeBloc, int>(
              bloc: homeBloc,
              builder: (context, state) => Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // UsersBloc usersBloc = UsersBloc(BlocState());
  // @override
  // void initState() {
  //   super.initState();
  //   usersBloc.add(LoadUsers());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UsersBloc, BlocState<List<User>>>(
        // bloc: usersBloc,
        builder: (context, state) {
          if (state.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                state.data!.length,
                (index) => UserCard(state.data![index]),
              ),
            );
          } else if (state.hasError) {
            return Center(
              child: Text(state.error!),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
