abstract class AdmineRessetPasswordEvent {}

class AdmineRessetPasswordTextChangedEvent extends AdmineRessetPasswordEvent {
  final String newpassword;
  final String retypepassword;
  final String otp;
  AdmineRessetPasswordTextChangedEvent(
      this.newpassword, this.retypepassword, this.otp);
}

class AdmineRessetPasswordSubmittedEvent extends AdmineRessetPasswordEvent {
  final String newpassword;
  final String retypepassword;
  final String otp;
  AdmineRessetPasswordSubmittedEvent(
      this.newpassword, this.retypepassword, this.otp);
}
