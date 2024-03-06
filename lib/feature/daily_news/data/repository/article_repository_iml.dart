import 'package:bloc_news/core/constants/constants.dart';
import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_news/feature/daily_news/data/models/article_model.dart';
import 'package:bloc_news/feature/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.values[httpResponse.response.statusCode!],
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
