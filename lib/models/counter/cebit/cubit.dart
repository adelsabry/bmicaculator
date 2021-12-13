import 'package:bloc/bloc.dart';
import 'package:bmicaculator/models/counter/cebit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit () : super(CounterIntialStates());


  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus()
  {
    counter--;
    emit(CounterMinusStates());
  }
  void plus(){
    counter++;
    emit(CounterPlusStates());
  }
}