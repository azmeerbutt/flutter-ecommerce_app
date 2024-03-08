import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/signup/bloc/register_events.dart';
import 'package:learn_it/pages/signup/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(const RegisterStates())
  {
    on<UserNameEvent>(_userNameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _userNameEvent(UserNameEvent event,Emitter<RegisterStates> emit){
    emit(state.copywith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event,Emitter<RegisterStates> emit){
    emit(state.copywith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event,Emitter<RegisterStates> emit){
    emit(state.copywith(password: event.password));
  }
  void _rePasswordEvent(RePasswordEvent event,Emitter<RegisterStates> emit){
    emit(state.copywith(rePassword: event.rePassword));
  }
}