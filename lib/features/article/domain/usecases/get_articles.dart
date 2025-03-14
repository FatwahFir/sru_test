import 'package:sru_test/core/usecase/usecase.dart';
import 'package:sru_test/core/utils/typedef.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:sru_test/features/article/domain/repositories/article_repository.dart';

class GetArticles extends UsecaseWithoutParams<List<Article>> {
  GetArticles({required ArticleRepository repo}) : _repo = repo;
  final ArticleRepository _repo;
  @override
  ResultFuture<List<Article>> call() => _repo.getArticles();
}
