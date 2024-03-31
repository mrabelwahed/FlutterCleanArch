import 'package:flutter_clean_arch/core/data_state.dart';
import 'package:flutter_clean_arch/core/usecase.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/repository/article_repository.dart';

class GetArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>,void> {
  final ArticleRepository _repository;

  GetArticlesUseCase(this._repository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _repository.getArticleList();
  }

}