import 'package:dashbaord_sou_okaz/Features/Auth/domain/entities/user_entity.dart';

abstract class SignUpStates {}

class InitialSignUpState extends SignUpStates {}

class LoadingSignUpState extends SignUpStates {}

class SuccessSignUpState extends SignUpStates {
  final UserEntity userEntity;

  SuccessSignUpState({required this.userEntity});
}

class FailureSignUpState extends SignUpStates {
  final String errMessage;

  FailureSignUpState({required this.errMessage});
}
