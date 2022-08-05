abstract class RessetPasswordState {
  var status;
}

class RessetPasswordInitialState extends RessetPasswordState {}

class RessetPasswordValidState extends RessetPasswordState {}

class RessetPasswordErrorState extends RessetPasswordState {
  final String errorMessage;
  RessetPasswordErrorState(this.errorMessage);
}

class RessetPasswordLoadingState extends RessetPasswordState {}
