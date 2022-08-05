import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'Reset_pass_event.dart';
import 'Reset_pass_state.dart';

class RessetPasswordBloc
    extends Bloc<RessetPasswordEvent, RessetPasswordState> {
  RessetPasswordBloc() : super(RessetPasswordInitialState()) {
    on<RessetPasswordTextChangedEvent>((event, emit) {
      if (event.newpassword.length < 8) {
        emit(RessetPasswordErrorState("please enter a valid password"));
      } else if (event.retypepassword.length < 8) {
        emit(RessetPasswordErrorState("Please enter a valid password"));
      } else if (event.otp.length < 6) {
        emit(RessetPasswordErrorState("Please enter valid otp"));
      } else {
        emit(RessetPasswordValidState());
      }
    });
    on<RessetPasswordSubmittedEvent>((event, emit) {
      emit(RessetPasswordLoadingState());
    });
  }
}
