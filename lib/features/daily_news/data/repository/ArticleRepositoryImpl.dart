import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/data_state.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constants.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getArticleList() async {
    try {
      final response = await _newsApiService.getNewsArticles(
        apiKey:newsAPIKey,
        country:countryQuery,
        category:categoryQuery,
      );
      if(response.response.statusCode == HttpStatus.ok) {
       return DataSuccess(response.data);
      }else {
       return DataFailed(
           DioError(
               error: response.response.statusMessage,
               response: response.response,
               requestOptions: response.response.requestOptions
           )
       );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }

  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    // TODO: implement getSavedArticles
    throw UnimplementedError();
  }

  @override
  Future<void> removeArticle(ArticleEntity articleEntity) {
    // TODO: implement removeArticle
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) {
    // TODO: implement saveArticle
    throw UnimplementedError();
  }

}