import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_quran/src/helpers/app_theme_wrapper.dart';
import 'package:learn_quran/src/views/pages/main_page.dart';
import 'package:quran_flutter/quran_flutter.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  await Quran.initialize();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
      ],
      fallbackLocale: const Locale('uz', 'UZ'),
      path: 'assets/localization',
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(builder: (theme, app) {
      return ToastificationWrapper(
        child: MaterialApp(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          title: 'Quran Learn',
          debugShowCheckedModeBanner: false,
          theme: theme.themeData,
          home: const MainPage(),
        ),
      );
    });
  }
}
