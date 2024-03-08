import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/application/bloc/app_events.dart';
import 'package:learn_it/pages/application/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvent,AppState>{
     AppBloc():super(const AppState()){
      on<TriggerAppEvent>((event, emit) {
        emit(AppState(index: event.index));
      },);
     }
}