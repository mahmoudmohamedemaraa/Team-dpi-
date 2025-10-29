import 'package:bloc/bloc.dart';
import 'package:depi_project/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';


part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepo authRepo;

  SplashCubit(this.authRepo) : super(SplashInitial());
}
