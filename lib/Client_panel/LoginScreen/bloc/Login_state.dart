abstract class LoginState {
  var status;
}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState {}
