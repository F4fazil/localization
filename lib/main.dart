import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/languageHadler.dart';
import 'package:localization/setting.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localizationService = LocalizationService();
  await localizationService.loadTranslations();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocalizationService(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationService = Provider.of<LocalizationService>(context);
    return MaterialApp(
      title: 'Localization App',
      locale: localizationService.locale, // Set the current locale
      supportedLocales: const [Locale('en'), Locale('km'), Locale('ja')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Add your custom localization delegate here
      ],
      debugShowCheckedModeBanner: false,
      home: SettingScreen(),
    );
  }
}
