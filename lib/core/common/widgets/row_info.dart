import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({
    super.key,
    required IconData icon,
    required String text,
    required Color iconColor,
    required TextStyle textStyle,
  })  : _icon = icon,
        _text = text,
        _iconColor = iconColor,
        _textStyle = textStyle;

  final IconData _icon;
  final String _text;
  final Color _iconColor;
  final TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5.sp,
      children: [
        Icon(
          _icon,
          size: 12.sp,
          color: _iconColor,
        ),
        Expanded(
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            _text,
            style: _textStyle,
          ),
        )
      ],
    );
  }
}
