abstract class AdmineLoginEvent {}

class AdmineLoginTextChangedEvent extends AdmineLoginEvent {
  final String email;
  final String password;

  AdmineLoginTextChangedEvent(this.email, this.password);
}

class AdmineLoginSubmittedEvent extends AdmineLoginEvent {
  final String email;
  final String password;

  AdmineLoginSubmittedEvent(this.email, this.password);
}
