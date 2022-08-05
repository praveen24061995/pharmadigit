abstract class AdmineLoginState {
  var status;
}

class AdmineLoginInitialState extends AdmineLoginState {}

class AdmineLoginValidState extends AdmineLoginState {}

class AdmineLoginErrorState extends AdmineLoginState {
  final String errorMessage;
  AdmineLoginErrorState(this.errorMessage);
}

class AdmineLoginLoadingState extends AdmineLoginState {}
