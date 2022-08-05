abstract class AdmineForgotPasswordState {
  var status;
}

class AdmineForgotPasswordInitialState extends AdmineForgotPasswordState {}

class AdmineForgotPasswordValidState extends AdmineForgotPasswordState {}

class AdmineForgotPasswordErrorState extends AdmineForgotPasswordState {
  final String errorMessage;
  AdmineForgotPasswordErrorState(this.errorMessage);
}

class AdmineForgotPasswordLoadingState extends AdmineForgotPasswordState {}
