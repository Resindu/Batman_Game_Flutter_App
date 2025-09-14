import 'dart:math';
import 'package:batman_game/counter_bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:batman_game/counter_bloc/counter_bloc.dart';
import 'package:batman_game/counter_bloc/counter_state.dart';


class CounterPage extends StatelessWidget{
  const CounterPage({super.key});


  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Batman Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state){
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                for(int index=0;index<state.count;index++)
                  Positioned(
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('images/batman2.jpg'),
                    
                  ),
                ),
              ],
            );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              counterBloc.add(CounterIncrement());
          },
          child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              counterBloc.add(CounterDecrement());
          },
          child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              counterBloc.add(CounterReset());
          },
          child: const Icon(Icons.exposure_zero),
          )
        ],
      ),
      

    );
  }

  
}