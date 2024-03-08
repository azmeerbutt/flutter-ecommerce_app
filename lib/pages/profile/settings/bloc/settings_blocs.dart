import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/profile/settings/bloc/settings_events.dart';
import 'package:learn_it/pages/profile/settings/bloc/settings_states.dart';

class SettingsBloc extends Bloc<SettingsEvent,SettingsState>{
  SettingsBloc():super(const SettingsState()){
    on<TriggerSettingsEvent>(_triggerSettings);
  }

  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit){
  emit(const SettingsState());
  }
}