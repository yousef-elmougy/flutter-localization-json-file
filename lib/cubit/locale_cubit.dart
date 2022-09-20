import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_strings.dart';
import '../locale/app_localizations.dart';


part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(const LocaleInitial(locale: Locale(AppStrings.englishCode)));

  // final SharedPreferences sharedPreferences;
  String currentCode = AppStrings.englishCode;

  Future<void> saveLocale({required String codeLange}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences
        .setString(AppStrings.locale, codeLange)
        .then((value) {
      currentCode = codeLange;
      emit(LocaleInitial(locale: _locale(currentCode)));
    }).catchError((error) {
      debugPrint(error);
    });
  }

  Future<void> getSavedLocale() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final x = sharedPreferences.getString(AppStrings.locale) ??
        AppStrings.englishCode;
    currentCode = x;
    emit(LocaleInitial(locale: _locale(currentCode)));
  }

  Locale _locale(String codeLang) {
    switch (codeLang) {
      case AppStrings.englishCode:
        return const Locale(AppStrings.englishCode);

      case AppStrings.arabicCode:
        return const Locale(AppStrings.arabicCode);

      default:
        return const Locale(AppStrings.englishCode);
    }
  }

}
