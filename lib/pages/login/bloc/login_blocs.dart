import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/login/bloc/login_events.dart';
import 'package:learn_it/pages/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  
   LoginBloc():super(const LoginState())
  {
       on<EmailEvent>(_emailEvent);

       on<PasswordEvent>(_passwordEvent);

   }
   void _emailEvent(EmailEvent event,Emitter<LoginState> emit){
    emit(state.copywith(email: event.email));
   }
   void _passwordEvent(PasswordEvent event,Emitter<LoginState> emit){
    emit(state.copywith(password: event.password));
   }
   
}