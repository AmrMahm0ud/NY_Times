import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:newyork_times/bloc/newyork/article_repo.dart';
import 'package:newyork_times/models/newyork/new_york.dart';
part 'newyork_event.dart';

part 'newyork_state.dart';

class NewyorkBloc extends Bloc<NewyorkEvent, NewyorkState> {

  BaseArticleRepository? baseArticleRepository;

  NewyorkBloc({this.baseArticleRepository}) : super(NewyorkInitial());
  @override
  Stream<NewyorkState> mapEventToState(
    NewyorkEvent event,
  ) async* {
    if(event is FetchData){
      yield NewyorkLoading();
      yield await baseArticleRepository!.articleDataResponse();
    }
  }
}
