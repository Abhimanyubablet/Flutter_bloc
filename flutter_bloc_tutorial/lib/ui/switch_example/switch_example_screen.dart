import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/switch_example/switch_event.dart';
import 'package:flutter_bloc_tutorial/bloc/switch_example/switch_states.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Example Two")),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc,SwitchStates>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      print("notify");
                      return Switch(value: state.isSwitch, onChanged: (newValue){
                        context.read<SwitchBloc>().add(EnableOrDisableNotification());
                      });
                    },
                )
              ],
            ),
            SizedBox(height: 30,),


            BlocBuilder<SwitchBloc,SwitchStates>(
              builder: (context, state) {
                return   Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),

            SizedBox(height: 50,),

            BlocBuilder<SwitchBloc,SwitchStates>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                print("build");
                return  Slider(value: state.slider, onChanged: (value){
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                },);
              },
            )


          ],
        ),
      ),
    );
  }
}