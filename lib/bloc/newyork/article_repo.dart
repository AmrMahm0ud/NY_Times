import 'dart:io';

import 'package:newyork_times/api_manager/article_api/artical_api.dart';
import 'package:newyork_times/bloc/newyork/newyork_bloc.dart';
import 'package:newyork_times/models/newyork/new_york.dart';

abstract class BaseArticleRepository {
  Future<NewyorkState> articleDataResponse();
}

class ArticleRepository extends BaseArticleRepository {
  @override
  Future<NewyorkState> articleDataResponse() async {
    BaseArticleApi? baseArticleApi=ArticleApi();
    NewyorkState? newyorkState;
    List<ArticleModel> articleModelList = await baseArticleApi.getArticleDateApi();
    try {
      if (articleModelList.isEmpty) {
        newyorkState = NewyorkEmptyState();
      } else {
        newyorkState = NewyorkSuccess(newyork: articleModelList);
      }
    } on SocketException catch (error) {
      newyorkState = NewyorkNetWorkError(networkError: error.toString());
    } catch (error) {
      newyorkState = NewyorkError(error: error.toString());
    }

    return newyorkState;
  }
}
