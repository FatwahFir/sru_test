import 'package:sru_test/core/usecase/usecase.dart';
import 'package:sru_test/core/utils/typedef.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:sru_test/features/article/domain/repositories/article_repository.dart';

class SearchArticle extends UsecaseWithParams<List<Article>, String> {
  SearchArticle({required ArticleRepository repo}) : _repo = repo;
  final ArticleRepository _repo;
  @override
  ResultFuture<List<Article>> call(String params) =>
      _repo.searchArticle(params);
}
