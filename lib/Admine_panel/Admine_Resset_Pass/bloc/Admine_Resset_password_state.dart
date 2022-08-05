abstract class AdmineRessetPasswordState {
  var status;
}

class AdmineRessetPasswordInitialState extends AdmineRessetPasswordState {}

class AdmineRessetPasswordValidState extends AdmineRessetPasswordState {}

class AdmineRessetPasswordErrorState extends AdmineRessetPasswordState {
  final String errorMessage;
  AdmineRessetPasswordErrorState(this.errorMessage);
}

class AdmineRessetPasswordLoadingState extends AdmineRessetPasswordState {}
