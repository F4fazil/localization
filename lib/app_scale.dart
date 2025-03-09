mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> EN = {title: 'Localization'};
  static const Map<String, dynamic> KM = {title: 'ការធ្វើមូលដ្ឋានីយកម្ម'};
  static const Map<String, dynamic> JA = {title: 'ローカリゼーション'};

  static String getTranslation(String key, String locale) {
    switch (locale) {
      case 'en':
        return EN[key] ?? key; // Fallback to the key if translation is missing
      case 'km':
        return KM[key] ?? key;
      case 'ja':
        return JA[key] ?? key;
      default:
        return EN[key] ?? key; // Fallback to English if locale is not supported
    }
  }
}
