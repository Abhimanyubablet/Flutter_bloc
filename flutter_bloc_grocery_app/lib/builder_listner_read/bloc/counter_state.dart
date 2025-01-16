part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitialState extends CounterState{}

// for blockBuilder ( means build ui)
class CounterIncrementState extends CounterState{
  final int? value;
  CounterIncrementState({ this.value = 0});
}

class CounterErrorState extends CounterState{}

// for blocListner

abstract class CounterActionState extends CounterState{}

class ShowSnackbarCounterActionState extends CounterActionState{}

class CounterIncActionState extends CounterState{}
