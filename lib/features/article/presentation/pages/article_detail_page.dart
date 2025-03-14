import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sru_test/core/common/widgets/rounded_button.dart';
import 'package:sru_test/core/common/widgets/row_info.dart';
import 'package:sru_test/core/extensions/context_extension.dart';
import 'package:sru_test/core/utils/date_formatter.dart';
import 'package:sru_test/core/utils/typedef.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({
    super.key,
  });

  static const routeName = '/article-detail';
  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late Article _article;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final arguments = ModalRoute.of(context)?.settings.arguments as DataMap;
      _article = arguments['article'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                onTap: () => Navigator.of(context).pop(),
                icon: Iconsax.back_square,
              ),
              RoundedButton(
                onTap: () async {
                  if (_article.url != null) {
                    await launchUrl(Uri.parse(_article.url!));
                  }
                },
                icon: Iconsax.global,
              ),
            ],
          ),
          backgroundColor: context.onSecondary,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(150.sp),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: BorderRadius.circular(50.sp),
                        ),
                        child: Text(
                          _article.source?.name ?? 'unknown',
                          style:
                              context.bodySmall.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        _article.title ?? '-',
                        style:
                            context.titleMedium.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 5.sp),
                      RowInfo(
                        icon: Iconsax.calendar,
                        text: DateFormatter.formatDate(_article.publishedAt),
                        iconColor: Colors.white,
                        textStyle: context.bodySmall.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ].animate(interval: 100.ms).fade(duration: 1000.ms).slideX(
                    begin: -0.2,
                    curve: Curves.easeOut,
                  ),
            ),
          ),
          expandedHeight: 300.sp,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              _article.urlToImage ?? 'https://i.sstatic.net/y9DpT.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              spacing: 20.sp,
              children: [
                Row(
                  spacing: 10.sp,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: context.tertiary,
                      child: Icon(
                        Iconsax.user,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _article.author ?? 'unknown',
                        style: context.titleSmall,
                      ),
                    )
                  ],
                ),
                Text(_article.content ?? 'No content'),
              ].animate(interval: 100.ms).fade(duration: 1000.ms).slideX(
                    begin: 0.2,
                    curve: Curves.easeOut,
                  ),
            ),
          ),
        ),
      ],
    ));
  }
}
