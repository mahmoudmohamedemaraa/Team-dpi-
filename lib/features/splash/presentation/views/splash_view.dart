import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/features/auth/domain/repos/auth_repo.dart';
import 'package:depi_project/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:depi_project/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(getIt<AuthRepo>()),
      child: const Scaffold(body: SplashViewBody()),
    );
  }
}
