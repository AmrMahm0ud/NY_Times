import 'package:newyork_times/bloc/newyork/newyork_bloc.dart';

abstract class BaseArticleRepo{
  Future<NewyorkState> articleDataResponse();
}
class ArticleRepo extends BaseArticleRepo{
  @override
  Future<NewyorkState> articleDataResponse() {

    throw UnimplementedError();
  }

}