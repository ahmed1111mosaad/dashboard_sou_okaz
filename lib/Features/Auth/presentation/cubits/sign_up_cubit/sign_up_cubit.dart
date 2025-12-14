import 'package:dashbaord_sou_okaz/Features/Auth/domain/repo/auth_repo.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authRepo) : super(InitialSignUpState());
  final AuthRepo authRepo;
  createUserWithEmailAndPassowrd({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    emit(LoadingSignUpState());
    var results = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
    );
    results.fold(
      (failure) {
        emit(FailureSignUpState(errMessage: failure.message));
        print(failure.message);
      },
      (userEntity) {
        emit(SuccessSignUpState(userEntity: userEntity));
      },
    );
  }
}
