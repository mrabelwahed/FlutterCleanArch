import 'package:flutter_clean_arch/features/daily_news/presentation/article/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repository/ArticleRepositoryImpl.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_articles.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetArticlesUseCase>(
      GetArticlesUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteArticleCubit>(
          ()=> RemoteArticleCubit(sl())
  );



}
