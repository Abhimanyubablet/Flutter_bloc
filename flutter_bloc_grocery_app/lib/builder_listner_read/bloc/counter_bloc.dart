import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterShowSnackbarActionEvent>(counterShowSnackbarActionEvent);
    on<CounterIncActionEvent>(counterIncActionEvent);
  }

  int count = 0;
  Future<void> counterIncrementEvent(CounterIncrementEvent event, Emitter<CounterState>emit) async{
    count = count + 1;
    emit(CounterIncrementState(value: count));
  }

  Future<void> counterShowSnackbarActionEvent(CounterShowSnackbarActionEvent event, Emitter<CounterState>emit) async{
    emit(ShowSnackbarCounterActionState());
  }

  Future<void> counterIncActionEvent(CounterIncActionEvent event, Emitter<CounterState>emit)async{
    emit(CounterIncActionState());
  }


}
