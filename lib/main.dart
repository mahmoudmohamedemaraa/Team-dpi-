import 'package:depi_project/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/shared_preferences_singleton.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesSingleton.init();
  setupGetit();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const DEPI(),
    ),
  );
}

class DEPI extends StatelessWidget {
  const DEPI({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          
          themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}

