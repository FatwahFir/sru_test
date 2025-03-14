import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sru_test/core/common/widgets/row_info.dart';
import 'package:sru_test/core/extensions/context_extension.dart';
import 'package:sru_test/core/utils/date_formatter.dart';
import 'package:sru_test/features/article/domain/entities/article.dart';
import 'package:sru_test/features/article/presentation/pages/article_detail_page.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required Article article,
  }) : _article = article;

  final Article _article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ArticleDetailPage.routeName,
        arguments: {
          'article': _article,
        },
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.09),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(2, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image.network(
                  _article.urlToImage ?? 'https://i.sstatic.net/y9DpT.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(14.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.sp,
                children: [
                  Text(
                    _article.title ?? '',
                    style: context.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RowInfo(
                          iconColor: context.primary,
                          textStyle: context.bodySmall.copyWith(
                            color: context.onSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                          icon: Iconsax.user,
                          text: _article.author ?? 'unknown',
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RowInfo(
                          iconColor: context.primary,
                          textStyle: context.bodySmall.copyWith(
                            color: context.onSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                          icon: Iconsax.calendar,
                          text: DateFormatter.formatDate(_article.publishedAt),
                        ),
                      )
                    ],
                  ),
                  Text(
                    _article.description ?? '',
                    style: context.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
