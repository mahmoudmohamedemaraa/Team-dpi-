import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final AuthRepo authRepo;

  Future<void> resetPassword(String emailOrNationalId) async {
    emit(ResetPasswordLoading());

    final result = await authRepo.resetPassword(emailOrNationalId);

    result.fold(
      (failure) => emit(ResetPasswordFailure(message: failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}
