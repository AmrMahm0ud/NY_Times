import 'package:dio/dio.dart';
import 'package:newyork_times/models/newyork/new_york.dart';

abstract class BaseArticleApi {
  getArticleDateApi();
}

class ArticleApi extends BaseArticleApi {
  final String _baseUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=gFRTIQwAwAAgVvVemuXAprEFLTSs5hEG";
  List<ArticleModel> newyorkList = [];

  @override
  Future<List<ArticleModel>> getArticleDateApi() async {
    final _response = await Dio().get(_baseUrl);
    final _result = _response.data['results'];

    for (var element in _result) {
      newyorkList.add(ArticleModel.fromMap(element as Map<String, dynamic>));
    }
    return newyorkList;
  }
}
