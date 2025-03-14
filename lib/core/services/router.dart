import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sru_test/core/services/injector_container.dart';
import 'package:sru_test/features/article/presentation/cubit/article_cubit.dart';
import 'package:sru_test/features/article/presentation/pages/article_detail_page.dart';
import 'package:sru_test/features/article/presentation/pages/articles_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _pageBuilder(
        (context) {
          return BlocProvider(
            create: (_) => sl<ArticleCubit>(),
            child: const ArticlesPage(),
          );
        },
        settings: settings,
      );
    case ArticleDetailPage.routeName:
      return _pageBuilder(
        (context) {
          return BlocProvider(
            create: (_) => sl<ArticleCubit>(),
            child: ArticleDetailPage(),
          );
        },
        settings: settings,
      );

    default:
      return _pageBuilder(
        (_) => const Placeholder(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => page(context),
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
