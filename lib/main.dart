import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/generated/app_localizations.dart';
import 'theme/app_theme.dart';
import 'screens/login_page.dart';
import 'providers/language_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'Door Access Mobile App',
            theme: AppTheme.darkTheme,
            home: const LoginPage(),
            debugShowCheckedModeBanner: false,
            
            // Localization configuration
            locale: languageProvider.currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LanguageProvider.supportedLocales,
            
            // Language change callback
            onGenerateTitle: (context) {
              return AppLocalizations.of(context)!.appTitle;
            },
          );
        },
      ),
    );
  }
}
