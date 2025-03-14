import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;
  Color get primary => theme.colorScheme.primary;
  Color get secondary => theme.colorScheme.secondary;
  Color get onSecondary => theme.colorScheme.onSecondary;
  Color get onPrimary => theme.colorScheme.onPrimary;
  Color get backgroundColor => theme.colorScheme.surface;
  Color get inversPrimaty => theme.colorScheme.inversePrimary;
  Color get errorColor => theme.colorScheme.error;
  Color get tertiary => theme.colorScheme.tertiary;

  TextStyle get titleLarge => theme.textTheme.titleLarge!;
  TextStyle get titleMedium => theme.textTheme.titleMedium!;
  TextStyle get titleSmall => theme.textTheme.titleSmall!;
  TextStyle get bodyLarge => theme.textTheme.bodyLarge!;
  TextStyle get bodyMedium => theme.textTheme.bodyMedium!;
  TextStyle get bodySmall => theme.textTheme.bodySmall!;
}
