import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/feature/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
