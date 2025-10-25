




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

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
      
  }
}
