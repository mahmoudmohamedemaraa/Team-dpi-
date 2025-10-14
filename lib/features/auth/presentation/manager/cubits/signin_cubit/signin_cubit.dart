import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signIn(String emailOrNationalId, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailOrNationalId(
      emailOrNationalId,
      password,
    );
    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }
}
