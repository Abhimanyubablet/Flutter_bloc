import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_grocery_app/builder_listner_read/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterBloc counterBloc = CounterBloc();

  @override
  void initState() {
    super.initState();
    counterBloc.add(CounterIncrementEvent());
  }

  int val = 0;
  @override
  Widget build(BuildContext context) {
    print("Abhi ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          "Counter App",
          style: TextStyle(color: Colors.white),
        )),

      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counterBloc.add(CounterIncrementEvent());
          }),

      // Using BlockBuilder

      // body: BlocBuilder<CounterBloc, CounterState>(
      //   bloc: counterBloc,
      //   builder: (context, state) {
      //     switch(state.runtimeType){
      //       case CounterIncrementState:
      //         final successState = state as CounterIncrementState;
      //         return Center(
      //     child: Text("Count : ${successState.value.toString()} "),
      //     );
      //       case CounterErrorState:
      //         return Center(child: Text("Error : Something happens please try sometime later! "),
      //         );
      //       default:
      //         return  Center(child: Text("Not Found")
      //         );
      //     }
      //
      //
      //   },
      // ),

      // Using BlockConsumer (using bloclistner you can achieve same thing of blocbuilder (but not very good))

      // body: BlocListener<CounterBloc, CounterState>(
      //   bloc: counterBloc,
      //   listener: (context, state) {
      //     if (state is ShowSnackbarCounterActionState) {
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(SnackBar(content: Text("Test Bloc Listner")));
      //     } else if (state is CounterIncActionState) {
      //       setState(() {
      //         val = val + 1;
      //       });
      //     }
      //   },
      //   child: Center(
      //     child: Container(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             "${val.toString()}",
      //             style: TextStyle(fontSize: 60),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           ElevatedButton(
      //               onPressed: () {
      //                 counterBloc.add(CounterIncActionEvent());
      //               },
      //               child: Text("Add")),
      //           ElevatedButton(
      //               onPressed: () {
      //                 counterBloc.add(CounterShowSnackbarActionEvent());
      //               },
      //               child: Text("Snackbar")),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),


      // both blocBuilder and blockListner will achieve by (BlocConsumer)

      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is !CounterActionState,
        listener: (context, state) {
          if (state is ShowSnackbarCounterActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Test BlocConsumer snack")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Count : ${successState.value.toString()} "),
                  ),

                    ElevatedButton(
                        onPressed: () {
                          counterBloc.add(CounterShowSnackbarActionEvent());
                        },
                        child: Text("Snackbar")),
                ],
              );
         
            case CounterErrorState:
              return Center(
                child: Text(
                    "Error : Something happens please try sometime later! "),
              );
            default:
              return Center(child: Text("Not Found"));
          }
        },
      ),
    );
  }
}
