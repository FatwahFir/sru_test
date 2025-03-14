part of 'article_cubit.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.initial() = _Initial;
  const factory ArticleState.loading() = _Loading;
  const factory ArticleState.empty() = _Empty;
  const factory ArticleState.articlesLoaded(List<Article> articles) =
      _ArticlesLoaded;
  const factory ArticleState.error(String message) = _Error;
}
