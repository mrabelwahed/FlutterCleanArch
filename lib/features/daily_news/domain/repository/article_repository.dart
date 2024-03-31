import 'package:flutter_clean_arch/features/daily_news/domain/entities/article_entity.dart';

import '../../../../core/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticleList();
  Future<List<ArticleEntity>> getSavedArticles();
  Future<void> saveArticle(ArticleEntity articleEntity);
  Future<void> removeArticle(ArticleEntity articleEntity);
}