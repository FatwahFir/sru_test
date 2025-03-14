import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sru_test/core/extensions/context_extension.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required IconData icon,
    required VoidCallback onTap,
  })  : _onTap = onTap,
        _icon = icon;

  final IconData _icon;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.sp,
      height: 45.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.tertiary.withValues(alpha: 0.3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            ClipOval(
              child: Center(
                child: IconButton(
                  onPressed: _onTap,
                  icon: Icon(
                    _icon,
                    size: 20.sp,
                    color: context.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
