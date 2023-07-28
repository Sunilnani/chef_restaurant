
import 'package:cheff_restaurant/misc/navigation_service.dart';
import 'package:cheff_restaurant/providers/shared_pref_provider.dart';
import 'package:cheff_restaurant/splash_screen.dart';
import 'package:cheff_restaurant/utils/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const MyApp(),
      )
  );
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final String? language = ref.watch(languagePrefsProvider);

    return MaterialApp(
      //restorationScopeId: 'farm_robo_service_app',
      debugShowCheckedModeBanner: false,
      //title: "Farm Robo Service App",
      //onGenerateTitle: (context) {
      // print(context.loc.appTitle);
      // return context.loc.appTitle;
      //},
      //locale: Locale(language ?? 'en'),
      theme: ThemeData(
        primarySwatch: ThemeConfig.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      navigatorObservers: <NavigatorObserver>[NavigationService.routeObserver],
      navigatorKey: NavigationService.navigatorKey,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}