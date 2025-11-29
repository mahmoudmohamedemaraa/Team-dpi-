import 'dart:developer';

import 'package:depi_project/core/services/custom_bloc_observer.dart';
import 'package:depi_project/features/splash/presentation/views/splash_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cubits/locale_cubit/locale_cubit.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/shared_preferences_singleton.dart';
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

  await dotenv.load(fileName: ".env");

  setupGetit();

  runApp(BlocProvider(create: (context) => LocaleCubit(), child: const DEPI()));
}

class DEPI extends StatelessWidget {
  const DEPI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            Locale currentLocale = const Locale('ar');
            if (state is LocaleChanged) {
              currentLocale = state.locale;
            }

            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: const Color.fromARGB(
                  255,
                  245,
                  247,
                  245,
                ),
                fontFamily: 'Cairo',
              ),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: currentLocale,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: onGenerateRoute,
              initialRoute: SplashScreen.routeName,
            );
          },
        );
      },
    );
  }
}
