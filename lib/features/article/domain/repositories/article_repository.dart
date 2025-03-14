import 'package:sru_test/core/utils/typedef.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';

abstract class ArticleRepository {
  ResultFuture<List<Article>> getArticles();
  ResultFuture<List<Article>> searchArticle(String params);
}
