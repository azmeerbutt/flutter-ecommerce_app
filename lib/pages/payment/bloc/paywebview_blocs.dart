import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_events.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_states.dart';

class PayViewBlocs extends Bloc<PayViewEvents, PayViewStates> {
  PayViewBlocs() : super(const PayViewStates()) {
    on<TriggerPayView>(_triggerPayView);
  }

  void _triggerPayView(TriggerPayView event, Emitter<PayViewStates> emit) {
    emit(state.copywith(url: event.url));
  }
}
