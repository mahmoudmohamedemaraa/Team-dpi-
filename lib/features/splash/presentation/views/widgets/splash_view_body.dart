import 'package:depi_project/features/auth/presentation/views/signin_view.dart';
import 'package:depi_project/core/utils/shared_preferences_singleton.dart';
import 'package:depi_project/contants.dart';
import 'package:depi_project/features/home/presentation/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final AnimationController _pulseController;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _rotationAnimation;
  late final Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    //  الأنيميشن الأساسي (الظهور + التكبير + التوهج + الدوران)
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();

    //  أنيميشن النبض المستمر بعد انتهاء الأنيميشن الأساسي
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
      lowerBound: 0.95,
      upperBound: 1.07,
    );

    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _pulseController.forward();
      }
    });

    //  دوران بسيط في البداية
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOutCubic),
      ),
    );

    //  تكبير تدريجي من الحجم الصغير للحجم الطبيعي
    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    //  توهّج ناعم بيزيد تدريجيًا
    _glowAnimation = Tween<double>(begin: 0, end: 25).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOutSine),
    );

    //  أنيميشن الظهور (fade in)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // لما الأنيميشن الأساسي يخلص → نبدأ النبض
    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.forward();
      }
    });

    // ⏱ الانتقال بعد الانيميشن: تحقق من حالة تسجيل الدخول
    Future.delayed(const Duration(seconds: 10), () async {
      final loggedIn = SharedPreferencesSingleton.getBool(isLoggedIn);
      if (loggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        Navigator.pushReplacementNamed(context, SigninView.routeName);
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_mainController, _pulseController]),
      builder: (context, child) {
        final effectiveScale = _scaleAnimation.value * _pulseController.value;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFCEEE4),
                const Color(0xFFFFF9F6),
                Colors.orangeAccent.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: effectiveScale,
                child: Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            253,
                            253,
                            253,
                          ).withOpacity(0.4),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: _glowAnimation.value * 0.3,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 400,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
