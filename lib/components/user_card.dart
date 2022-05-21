import 'package:flutter/material.dart';
import 'package:my_app/blocs/users_bloc.dart';
import 'package:my_app/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(user.avatar),
          const SizedBox(
            height: 10.0,
          ),
          Text(user.firstName + " " + user.lastName),
          const SizedBox(
            height: 10.0,
          ),
          Text(user.email),
        ],
      ),
    );
  }
}
