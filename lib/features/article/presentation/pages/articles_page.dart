import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sru_test/core/common/widgets/search_field.dart';
import 'package:sru_test/features/article/presentation/cubit/article_cubit.dart';
import 'package:sru_test/features/article/presentation/widgets/article_card.dart';
import 'package:sru_test/core/common/widgets/error_widget.dart' as my_widget;

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleCubit>().getArticles(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SearchField(
          onSearch: (params) {
            if (params != '') {
              context.read<ArticleCubit>().searchArticle(params);
            }
          },
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => context.read<ArticleCubit>().getArticles(true),
          child: BlocBuilder<ArticleCubit, ArticleState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
                articlesLoaded: (articles) {
                  return ListView.separated(
                    padding: EdgeInsets.only(top: 15.sp),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.sp,
                    ),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return ArticleCard(
                        article: articles[index],
                      )
                          .animate(delay: (index * 100).ms)
                          .fade(duration: 1000.ms)
                          .slideY(
                            begin: 0.1,
                            curve: Curves.easeOut,
                          );
                    },
                  );
                },
                empty: () => my_widget.ErrorWidget(
                  text: 'No data found.',
                  action: () => context.read<ArticleCubit>().getArticles(false),
                ),
                error: (message) => my_widget.ErrorWidget(
                  text: "Error occured: $message",
                  action: () => context.read<ArticleCubit>().getArticles(false),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
