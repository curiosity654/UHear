import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uhear/api.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchUninitialized();

  @override
  Stream<SearchState> mapEventToState (
    SearchEvent event,
  ) async* {
    if (event is SearchFetch) {
      try {
        yield SearchLoading();
        final res = await api.search(event.query);
        yield SearchLoaded(res: res);
      } catch (_) {
        yield SearchError();
      }
    }
  }
}