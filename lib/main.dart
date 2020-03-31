import 'package:covidinfo/database/moor_database.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/routes/routes.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() => runApp(CovidInfoApp());

Map<int, Color> color = {
  50: AppColors.primary,
  100: AppColors.primary,
  200: AppColors.primary,
  300: AppColors.primary,
  400: AppColors.primary,
  500: AppColors.primary,
  600: AppColors.primary,
  700: AppColors.primary,
  800: AppColors.primary,
  900: AppColors.primary,
};

MaterialColor colorCustom = MaterialColor(0xFFCC3300, color);

class CovidInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => AppDatabase()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CovidInfo',
        theme: ThemeData(
          primarySwatch: colorCustom,
          cursorColor: colorCustom,
          accentColor: AppColors.primary,
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          if (locale == null) {
            return supportedLocales.first;
          }

          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
