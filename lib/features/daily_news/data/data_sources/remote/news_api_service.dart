
import 'package:flutter_clean_arch/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsBaseUrl)
abstract class NewsApiService {
  factory  NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category});
}