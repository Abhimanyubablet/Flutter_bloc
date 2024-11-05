import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_tutorial/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }
  @override
  void dispose() {
    super.dispose();
    _counterBloc = CounterBloc();

  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Counter Example")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            BlocBuilder <CounterBloc, CounterState>(
              builder: (context, state) {
                print(state.counter.toString());
                return Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 60),));
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                BlocBuilder <CounterBloc, CounterState>(
                  buildWhen: (current,previous) => false,
                  builder: (context, state) {
                    print(state.counter.toString());
                    return ElevatedButton(onPressed: (){
                      context.read<CounterBloc>().add(IncrementCounter());
                    }, child: Text("Increment"));
                  },
                ),


                SizedBox(width: 20,),

                BlocBuilder <CounterBloc, CounterState>(
                  buildWhen: (current,previous) => false,
                  builder: (context, state) {
                    print(state.counter.toString());
                    return ElevatedButton(onPressed: (){
                      context.read<CounterBloc>().add(DecrementCounter());
                    }, child: Text("Decrement"));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
