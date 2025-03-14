import 'package:bloc/bloc.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sru_test/features/article/domain/usecases/get_articles.dart';
import 'package:sru_test/features/article/domain/usecases/search_article.dart';

part 'article_state.dart';
part 'article_cubit.freezed.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({
    required GetArticles getArticles,
    required SearchArticle searchArticle,
  })  : _getArticles = getArticles,
        _searchArticle = searchArticle,
        super(ArticleState.initial());
  final GetArticles _getArticles;
  final SearchArticle _searchArticle;

  Future<void> getArticles(bool isRefreshing) async {
    if (!isRefreshing) emit(ArticleState.loading());
    final res = await _getArticles();

    res.fold(
      (l) => emit(ArticleState.error(l.message)),
      (r) {
        if (r.isNotEmpty) {
          emit(ArticleState.articlesLoaded(r));
        } else {
          emit(ArticleState.empty());
        }
      },
    );
  }

  Future<void> searchArticle(String params) async {
    emit(ArticleState.loading());

    final res = await _searchArticle(params);

    res.fold(
      (l) => emit(ArticleState.error(l.message)),
      (r) {
        if (r.isNotEmpty) {
          emit(ArticleState.articlesLoaded(r));
        } else {
          emit(ArticleState.empty());
        }
      },
    );
  }
}
