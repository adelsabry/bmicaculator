import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cebit/cubit.dart';
import 'cebit/states.dart';

// state less contain one class provide widget

// state ful contain classes

// 1. first class provide widget
// 2.second class provide state from this widget


class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context ,state) {

          if(state is CounterPlusStates)
          {
            //print('plus state${state.counter}');
          }
          if(state is CounterMinusStates)
            {
              //print('minus state${state.counter}');
            }
        },
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).minus();
                  }, child: Text(
                    'MIUNS',
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('${CounterCubit.get(context).counter}', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),),
                  ),
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).plus();
                  }, child: Text(
                    'PLUS',
                  ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
