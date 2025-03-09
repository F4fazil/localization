# localization

This Flutter project is focused on implementing localization, allowing the app to support multiple languages. The main components of the project include:

Dependencies:

flutter_localization: A package to handle localization.
intl: A package for internationalization and localization.
provider: A package for state management.
Localization Files:

JSON files (en.json, km.json, ja.json) located in the locale directory. These files contain key-value pairs for different languages.
Localization Service:

A service that handles the current locale and provides methods to change the locale.
SettingScreen:

A stateful widget that displays buttons to switch between English, Japanese, and Khmer languages.
Uses an AnimationController and CurvedAnimation to animate the screen's opacity.
Displays translated text based on the selected locale.
Main Application:

The main.dart file initializes the app with the LocalizationService and sets up the supported locales and localization delegates.
The MaterialApp widget is configured to use the current locale and provide localization support.
Key Files and Their Roles:
pubspec.yaml:

Defines the project dependencies and assets.
Ensures the localization JSON files are included in the app bundle.
main.dart:

Initializes the app with the LocalizationService.
Configures the MaterialApp with supported locales and localization delegates.
setting.dart:

Contains the SettingScreen widget.
Provides UI elements to switch between languages and displays translated text.
Localization JSON Files:

en.json, km.json, ja.json: Contain translations for different languages.
