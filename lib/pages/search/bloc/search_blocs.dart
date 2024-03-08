import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/pages/search/bloc/search_events.dart';
import 'package:learn_it/pages/search/bloc/search_states.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  SearchBloc() : super(const SearchStates());
}
