import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_sun_s1/features/modules/counter/controller/cubit/state.dart';

class AppCounterCubit extends Cubit<AppCounterStates>
{
  AppCounterCubit(): super(AppInitialCounterState());

  static AppCounterCubit get(context)=>BlocProvider.of(context);

  int count = 0;
  void incrementData()
  {
    count++;
    emit(AppIncrementCounterState());
  }

  void decrementData()
  {
    count--;
    emit(AppDecrementCounterState());
  }


}