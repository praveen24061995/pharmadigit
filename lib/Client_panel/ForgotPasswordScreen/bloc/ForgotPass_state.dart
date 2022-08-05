abstract class ForgotPasswordState {
  var status;
}

class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordValidState extends ForgotPasswordState {}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String errorMessage;
  ForgotPasswordErrorState(this.errorMessage);
}

class ForgotPasswordLoadingState extends ForgotPasswordState {}
