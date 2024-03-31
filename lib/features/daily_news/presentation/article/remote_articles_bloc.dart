import 'package:flutter_clean_arch/core/data_state.dart';
import 'package:flutter_clean_arch/features/daily_news/domain/usecases/get_articles.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/article/remote_article_states.dart';
import 'package:flutter_clean_arch/features/daily_news/presentation/article/remote_articles_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RemoteArticleCubit extends Bloc<RemoteArticleEvent,RemoteArticleStates> {

  final GetArticlesUseCase _getArticleUseCase;

  RemoteArticleCubit(this._getArticleUseCase) : super(const RemoteArticleLoading()){
    on <GetArticles> (onGetArticles);
  }


  void onGetArticles(GetArticles event, Emitter < RemoteArticleStates > emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteArticleSuccess(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteArticleFailure(dataState.error!)
      );
    }
  }
}