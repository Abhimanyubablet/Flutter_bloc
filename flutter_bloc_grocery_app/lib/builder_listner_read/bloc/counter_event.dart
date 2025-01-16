part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent{}

class CounterShowSnackbarActionEvent extends CounterEvent{}

class CounterIncActionEvent extends CounterEvent{}
