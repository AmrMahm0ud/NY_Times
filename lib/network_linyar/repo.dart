import 'package:dio/dio.dart';
import 'package:newyork_times/Network_Linyar/interceptors/interceptors.dart';
class UserRepository {
  static final UserRepository _singletonUserRepository =
  UserRepository._internal();
  static Dio? _dio;

  factory UserRepository() {
    _initDio();
    return _singletonUserRepository;
  }
  static void _initDio() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.interceptors.add(CustomInterceptors());

    }
  }
  UserRepository._internal();
}