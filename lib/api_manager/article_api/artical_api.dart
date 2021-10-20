import 'package:dio/dio.dart';
import 'package:newyork_times/models/newyork/new_york.dart';

abstract class BaseArticleApi {
  Future<List<ArticleModel>> getArticleDateApi();
}

class ArticleApi extends BaseArticleApi {
  late final dynamic _response;
  final String _baseUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG";
  List<ArticleModel>? newyorkList = [];

  @override
  Future<List<ArticleModel>> getArticleDateApi() async {
    _response = await Dio().get(_baseUrl);
    final result = _response.data['results'] as List<dynamic>;
    for (var element in result) {
      newyorkList!.add(ArticleModel.fromMap(element as Map<String, dynamic>));
    }
    return newyorkList!;
  }
}
