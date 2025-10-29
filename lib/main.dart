import 'dart:developer';

import 'package:depi_project/core/services/custom_bloc_observer.dart';
import 'package:depi_project/features/auth/presentation/views/signin_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/helpers/on_generate_routes.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/shared_preferences_singleton.dart';
import 'features/auth/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log('Firebase initialized');
  } on Exception catch (e) {
    log('Error initializing Firebase: $e');
  }
  await SharedPreferencesSingleton.init();

  setupGetit();

  runApp(const DEPI());
}

class DEPI extends StatelessWidget {
  const DEPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 247, 245),
        fontFamily: 'Cairo',
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute:  SplashScreen.routeName,


    );
  }
}
