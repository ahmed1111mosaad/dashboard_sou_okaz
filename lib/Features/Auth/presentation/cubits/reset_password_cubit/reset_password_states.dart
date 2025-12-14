abstract class ResetPasswordStates {}

class InitialResetPasswordState extends ResetPasswordStates {}

class LoadingResetPasswordState extends ResetPasswordStates {}

class SuccessResetPasswordState extends ResetPasswordStates {}

class FailureResetPasswordState extends ResetPasswordStates {
  final String errMessage;

  FailureResetPasswordState({required this.errMessage});
}
