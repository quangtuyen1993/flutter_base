import 'package:flutter/material.dart';

import '../../../generated/colors.gen.dart';
import 'text_theme_interfaces.dart';
import 'text_theme_provider.dart';

class AppTheme {
  final TextThemeFactory factory;

  AppTheme._(this.factory);

  factory AppTheme.create(
    Locale locale, {
    Map<Locale, TextThemeFactory> mapper = const {},
    AppThemeFilters? filter,
  }) {
    final provider = TextThemeFactoryProvider.of(mapper: mapper);
    final factory = provider.find(locale, filter: filter);
    return AppTheme._(factory);
  }

  ThemeData build() {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: ColorName.materialPrimary,
        backgroundColor: ColorName.background,
      ),
      textTheme: factory.create(),
    );
  }
}
