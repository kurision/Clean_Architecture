import 'package:bloc_news/core/resources/data_state.dart';
import 'package:bloc_news/core/usecase/usecase.dart';
import 'package:bloc_news/feature/daily_news/domain/entities/article.dart';
import 'package:bloc_news/feature/daily_news/domain/repository/article_repository.dart';

class GetArticleUsecase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUsecase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
