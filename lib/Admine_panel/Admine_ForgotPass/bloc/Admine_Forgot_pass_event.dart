abstract class AdmineForgotPasswordEvent {}

class AdmineForgotPasswordTextChangedEvent extends AdmineForgotPasswordEvent {
  final String email;

  AdmineForgotPasswordTextChangedEvent(
    this.email,
  );
}

class AdmineForgotPasswordSubmittedEvent extends AdmineForgotPasswordEvent {
  final String email;

  AdmineForgotPasswordSubmittedEvent(
    this.email,
  );
}
