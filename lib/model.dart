import 'package:flutter/material.dart';

import 'locale/app_localizations.dart';

class LocaleModel {
  final String flag, name, languageCode;
  final int id;

  LocaleModel(
    this.id,
    this.flag,
    this.name,
    this.languageCode,
  );

  static List<LocaleModel> languages = [
    LocaleModel(2, "🇺🇸", "English", "en"),
    LocaleModel(3, "🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
  ];
}

extension TranslateX on String {
  String? tr(BuildContext context) =>
      AppLocalizations.of(context)!.translate(this);
}
