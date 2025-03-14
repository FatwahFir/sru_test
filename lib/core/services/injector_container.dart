import 'package:get_it/get_it.dart';
import 'package:sru_test/core/config/env_config.dart';
import 'package:sru_test/features/article/data/datasources/article_datasource.dart';
import 'package:sru_test/features/article/data/repositories/article_repository_impl.dart';
import 'package:sru_test/features/article/domain/repositories/article_repository.dart';
import 'package:sru_test/features/article/domain/usecases/get_articles.dart';
import 'package:sru_test/features/article/domain/usecases/search_article.dart';
import 'package:sru_test/features/article/presentation/cubit/article_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  final envConfig = await EnvConfig.create();
  sl.registerSingleton<EnvConfig>(envConfig);
  await _articleInit();
}

Future<void> _articleInit() async {
  sl
    ..registerFactory(
        () => ArticleCubit(getArticles: sl(), searchArticle: sl()))
    ..registerLazySingleton(
      () => GetArticles(
        repo: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SearchArticle(
        repo: sl(),
      ),
    )
    ..registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(
        datasource: sl(),
      ),
    )
    ..registerLazySingleton<ArticleDatasource>(
      () => ArticleDatasourceImpl(
        client: sl(),
      ),
    )
    ..registerLazySingleton(
      () => http.Client(),
    );
}
