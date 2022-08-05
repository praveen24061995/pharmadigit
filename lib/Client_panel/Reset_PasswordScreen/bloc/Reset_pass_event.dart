abstract class RessetPasswordEvent {}

class RessetPasswordTextChangedEvent extends RessetPasswordEvent {
  final String newpassword;
  final String retypepassword;
  final String otp;
  RessetPasswordTextChangedEvent(
      this.newpassword, this.retypepassword, this.otp);
}

class RessetPasswordSubmittedEvent extends RessetPasswordEvent {
  final String newpassword;
  final String retypepassword;
  final String otp;
  RessetPasswordSubmittedEvent(this.newpassword, this.retypepassword, this.otp);
}
