import 'package:flutter/material.dart';
import 'package:localization/languageHadler.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizationService = Provider.of<LocalizationService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizationService.translate('title')),
        backgroundColor: Colors.teal,
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('English'),
                onPressed: () {
                  localizationService.setLocale(const Locale('en'));
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Japanese'),
                onPressed: () {
                  localizationService.setLocale(const Locale('ja'));
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Khmer'),
                onPressed: () {
                  localizationService.setLocale(const Locale('km'));
                },
              ),
              const SizedBox(height: 32),
              Consumer<LocalizationService>(
                builder: (context, localizationService, child) {
                  return Text(
                    localizationService.translate('i_am_good'),
                    style: const TextStyle(fontSize: 24, color: Colors.black54),
                  );
                },
              ),
              const SizedBox(height: 20),
              Consumer<LocalizationService>(
                builder: (context, localizationService, child) {
                  return Text(
                    localizationService.translate('name'),
                    style: const TextStyle(fontSize: 24, color: Colors.black54),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
