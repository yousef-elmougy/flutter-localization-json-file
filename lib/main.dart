import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_clean_architecture_json/screen.dart';

import 'cubit/locale_cubit.dart';
import 'locale/app_localizations_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LocaleCubit()..getSavedLocale(),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) => MaterialApp(
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          ),
        ),
      );
}
