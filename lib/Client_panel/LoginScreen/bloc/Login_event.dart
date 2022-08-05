abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String email;
  final String password;
  final String uniqueid;
  LoginTextChangedEvent(this.email, this.password, this.uniqueid);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  final String uniqueid;
  LoginSubmittedEvent(this.email, this.password, this.uniqueid);
}
