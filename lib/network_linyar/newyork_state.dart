part of 'newyork_bloc.dart';

abstract class NewyorkState {}

class NewyorkInitial extends NewyorkState {}

class NewyorkLoading extends NewyorkState {
  bool isLoading;

  NewyorkLoading({this.isLoading = false});
}

class NewyorkSuccess extends NewyorkState {
  bool isSuccess;
  List<ArticleModel>? newyork;

  NewyorkSuccess( {this.isSuccess = false,this.newyork});
}

class NewyorkError extends NewyorkState {
  String error;

  NewyorkError({this.error = "Error "});
}

class NewyorkNetWorkError extends NewyorkState {
  String networkError;

  NewyorkNetWorkError({this.networkError = "Network Error"});
}
