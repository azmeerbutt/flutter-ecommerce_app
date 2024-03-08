import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/product/bloc/product_events.dart';
import 'package:learn_it/pages/product/bloc/product_states.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<TriggerProductEvent>(_triggerProductEvent);
  }

  void _triggerProductEvent(
      TriggerProductEvent event, Emitter<ProductState> emit) {
    emit(state.copywith(courseItem: event.coursItem));
  }
}
