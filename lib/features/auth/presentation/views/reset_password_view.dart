import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'widgets/reset_password_view_body_bloc_consumer.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const routeName = 'reset_password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
      child: const Scaffold(body: ResetPasswordViewBodyBlocConsumer()),
    );
  }
}
