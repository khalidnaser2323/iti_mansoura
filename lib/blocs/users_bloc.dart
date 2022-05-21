import 'package:bloc/bloc.dart';
import 'package:my_app/blocs/bloc_state.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/repos/users_repo.dart';

class UserBlocEvent {}

class LoadUsers extends UserBlocEvent {}

class UsersBloc extends Bloc<UserBlocEvent, BlocState<List<User>>> {
  UsersBloc(BlocState<List<User>> initialState) : super(BlocState()) {
    on<LoadUsers>((event, emit) async {
      emit(BlocState(waiting: true));
      try {
        List<User> users = await UsersRepo().getUsers();
        emit(BlocState(hasData: true, data: users));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
      }
    });
  }
}
