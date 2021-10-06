import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:newyork_times/network_linyar/models/new_york.dart';

part 'newyork_event.dart';

part 'newyork_state.dart';

class NewyorkBloc extends Bloc<NewyorkEvent, NewyorkState> {
  NewyorkBloc() : super(NewyorkInitial());
  var response;

  @override
  Stream<NewyorkState> mapEventToState(
    NewyorkEvent event,
  ) async* {
    yield NewyorkLoading(isLoading: true);
    try {
      List<NewYork> newyorkList = [];
      response = await Dio().get(
          "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG");
      print(response.data);
      final result = response.data['results'] as List<dynamic>;
      // newyorkList.add(NewYork.fromJson(result));
      yield NewyorkSuccess(isSuccess: true);
    } on Exception catch (e) {
      yield NewyorkError(error: e.toString());
      yield NewyorkNetWorkError(networkError: e.toString());
    }
  }
}
