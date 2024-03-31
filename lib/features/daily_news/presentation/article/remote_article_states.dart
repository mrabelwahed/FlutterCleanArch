import 'package:equatable/equatable.dart';

import '../../domain/entities/article_entity.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleStates extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioError? dioError;

  const RemoteArticleStates({this.articles, this.dioError});

  @override
  List<Object?> get props => [articles!, dioError!];
}

class RemoteArticleLoading extends RemoteArticleStates {
  const RemoteArticleLoading();
}

class RemoteArticleSuccess extends RemoteArticleStates {
  const RemoteArticleSuccess(List<ArticleEntity>  articles) : super(articles: articles);
}

class RemoteArticleFailure extends RemoteArticleStates {
  const RemoteArticleFailure(DioError? dioError) : super(dioError: dioError);
}