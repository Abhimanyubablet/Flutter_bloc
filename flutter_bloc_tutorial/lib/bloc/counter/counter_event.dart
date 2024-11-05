
import 'package:equatable/equatable.dart';

// abstract class is react like a base class.
// It define the behavior of sub class.
// abstract class cannot define the direct instance

abstract class CounterEvent extends Equatable{
  const CounterEvent();

  @override
  List<Object?> get props => [];

}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}