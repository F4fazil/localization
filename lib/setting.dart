import 'package:flutter/material.dart';
import 'package:localization/languageHadler.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final localizationService = Provider.of<LocalizationService>(context);

    return Scaffold(
      appBar: AppBar(title: Text(localizationService.translate('title'))),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('English'),
            onPressed: () {
              localizationService.setLocale(
                const Locale('en'),
              ); // Change to English
            },
          ),
          ElevatedButton(
            child: const Text('Japanese'),
            onPressed: () {
              localizationService.setLocale(
                const Locale('ja'),
              ); // Change to Japanese
            },
          ),
          ElevatedButton(
            child: const Text('Khmer'),
            onPressed: () {
              localizationService.setLocale(
                const Locale('km'),
              ); // Change to Khmer
            },
          ),
          Consumer<LocalizationService>(
            builder: (context, localizationService, child) {
              return Text(localizationService.translate('i_am_good'));
            },
          ),
        ],
      ),
    );
  }
}
