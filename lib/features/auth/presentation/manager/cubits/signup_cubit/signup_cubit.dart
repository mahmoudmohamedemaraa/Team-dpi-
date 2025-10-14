import 'package:bloc/bloc.dart';
import 'package:depi_project/features/auth/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

import '../../../../domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
    UserEntity user,
    String password,
  ) async {
    emit(SignupLoading());
    try {
      final exists = await authRepo.isNationalIdRegistered(user.nationalId);
      if (exists) {
        emit(SignupFailure(errorMessage: 'الرقم القومي مسجل بالفعل'));
        return;
      }
    } catch (e) {
      emit(SignupFailure(errorMessage: 'حدث خطأ أثناء التحقق من الرقم القومي'));
      return;
    }

    final result = await authRepo.createUserWithEmailAndPassword(
      user.email,
      password,
      user.firstName,
      user.lastName,
      user.phoneNumber,
      user.nationalId,
    );
    result.fold(
      (failure) => emit(SignupFailure(errorMessage: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
