import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:newyork_times/network_linyar/models/new_york.dart';

part 'newyork_event.dart';

part 'newyork_state.dart';

class NewyorkBloc extends Bloc<NewyorkEvent, NewyorkState> {
  NewyorkBloc() : super(NewyorkInitial());
  late final  _response;
  final String _baseUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG";

  @override
  Stream<NewyorkState> mapEventToState(
    NewyorkEvent event,
  ) async* {
    List<ArticleModel> newyorkList = [];
    if(event is FetchData){
      yield NewyorkLoading();
      try {
        _response = await Dio().get(_baseUrl);
        final result = _response.data['results'] as List<dynamic>;
        for (var element in result) {
          newyorkList.add(ArticleModel.fromMap(element as Map<String, dynamic>));
        }
        yield NewyorkSuccess(newyork: newyorkList);
      } catch (e) {
        yield NewyorkError(error: e.toString());
        yield NewyorkNetWorkError(networkError: e.toString());
      }
    }
  }
}
