import 'package:bloc_news/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:bloc_news/feature/daily_news/data/repository/article_repository_iml.dart';
import 'package:bloc_news/feature/daily_news/domain/repository/article_repository.dart';
import 'package:bloc_news/feature/daily_news/domain/usecases/get_article.dart';
import 'package:bloc_news/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initilaizeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());
//Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
//Usecases
  sl.registerLazySingleton<GetArticleUsecase>(() => GetArticleUsecase(sl()));

  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
