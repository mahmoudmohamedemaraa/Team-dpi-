import 'package:depi_project/features/add_report/presentation/views/add_report_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case AddReportView.routeName:
      return MaterialPageRoute(builder: (context) => const AddReportView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
