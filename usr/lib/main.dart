import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';

// Placeholder for Database initialization
// import 'features/database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPrefs
  final prefs = await SharedPreferences.getInstance();
  
  // Initialize Database (will be implemented later)
  // final database = AppDatabase();

  runApp(
    ProviderScope(
      overrides: [
        // databaseProvider.overrideWithValue(database),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'دفتر البيت الذكي',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Can be controlled by provider later
      
      // Localization Setup
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'YE'), // Default
        Locale('en', ''),
      ],
      locale: const Locale('ar', 'YE'), // Force Arabic for now, can be dynamic
      
      initialRoute: '/',
      routes: {
        '/': (context) => const Scaffold(body: Center(child: Text('Loading...'))), // Placeholder
      },
    );
  }
}
