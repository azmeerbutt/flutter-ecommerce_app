import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/home/bloc/home_events.dart';
import 'package:learn_it/pages/home/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(const HomeState()){
    on<TriggerSlideEvent>(_triggerSlideEvent);
    on<HomeCourseItemEvent>(_homeCourseItemEvent);
  }
 void _triggerSlideEvent(TriggerSlideEvent event , Emitter<HomeState> emit){
    emit(state.copywith(index: event.index));
  }

  void _homeCourseItemEvent(HomeCourseItemEvent event , Emitter<HomeState> emit){
    emit(state.copywith(courseItem: event.courseItem));
  }
}