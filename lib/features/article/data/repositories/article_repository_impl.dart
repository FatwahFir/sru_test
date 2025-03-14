import 'package:dartz/dartz.dart';
import 'package:sru_test/core/errors/exceptions.dart';
import 'package:sru_test/core/errors/failure.dart';
import 'package:sru_test/core/utils/typedef.dart';
import 'package:sru_test/features/article/data/datasources/article_datasource.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:sru_test/features/article/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl({required ArticleDatasource datasource})
      : _datasource = datasource;
  final ArticleDatasource _datasource;

  @override
  ResultFuture<List<Article>> getArticles() async {
    try {
      final res = await _datasource.getArticles();
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  ResultFuture<List<Article>> searchArticle(String params) async {
    try {
      final res = await _datasource.searchArticle(params);
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
