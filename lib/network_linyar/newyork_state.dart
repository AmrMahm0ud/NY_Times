part of 'newyork_bloc.dart';

abstract class NewyorkState {}

class NewyorkInitial extends NewyorkState {}

class NewyorkLoading extends NewyorkState {
}


class NewyorkSuccess extends NewyorkState {
  List<ArticleModel>? newyork;

  NewyorkSuccess( {this.newyork});
}

class NewyorkError extends NewyorkState {
  String error;

  NewyorkError({this.error = "Error "});
}

class NewyorkNetWorkError extends NewyorkState {
  String networkError;

  NewyorkNetWorkError({this.networkError = "Network Error"});
}
