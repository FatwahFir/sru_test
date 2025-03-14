import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sru_test/core/extensions/context_extension.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required String text,
    required VoidCallback action,
  })  : _text = text,
        _action = action;

  final String _text;
  final VoidCallback _action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 15.sp,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _text,
            style: context.bodyMedium,
          ),
          ElevatedButton(
            onPressed: _action,
            child: Text(
              'Reload',
              style: context.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
