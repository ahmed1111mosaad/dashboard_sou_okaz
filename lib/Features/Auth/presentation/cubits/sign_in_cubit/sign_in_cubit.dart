import 'package:dashbaord_sou_okaz/Features/Auth/domain/repo/auth_repo.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(this.authRepo) : super(InitialSignInState());
  final AuthRepo authRepo;

  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoadingSignInState());
    var result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(FailureSignInState(errMessage: failure.message));
      },
      (userEntity) {
        if (userEntity.role == 'Admin') {
          emit(SuccessSignInState(userEntity: userEntity, isAdmin: true));
        } else {
          emit(SuccessSignInState(userEntity: userEntity, isAdmin: false));
        }
        print(userEntity.role);
      },
    );
  }
}
