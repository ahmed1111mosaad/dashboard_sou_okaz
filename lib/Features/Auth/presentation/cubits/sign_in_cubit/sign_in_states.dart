import 'package:dashbaord_sou_okaz/Features/Auth/domain/entities/user_entity.dart';

abstract class SignInStates {}

class InitialSignInState extends SignInStates {}

class LoadingSignInState extends SignInStates {}

class SuccessSignInState extends SignInStates {
  final UserEntity userEntity;
  final bool isAdmin;

  SuccessSignInState({required this.userEntity, required this.isAdmin});
}

class FailureSignInState extends SignInStates {
  final String errMessage;

  FailureSignInState({required this.errMessage});
}
