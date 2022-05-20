import 'package:bloc/bloc.dart';

class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class HomeBloc extends Bloc<CounterEvent, int> {
  HomeBloc(int initialState) : super(0) {
    on<IncrementCounter>((event, emit) => emit(state + 1));
    on<DecrementCounter>((event, emit) => emit(state - 1));
  }
}
