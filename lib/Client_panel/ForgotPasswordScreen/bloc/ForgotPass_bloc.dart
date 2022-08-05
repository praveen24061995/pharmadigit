import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'ForgotPass_event.dart';
import 'ForgotPass_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
    on<ForgotPasswordTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(ForgotPasswordErrorState("please enter a valid email addres"));
      } else {
        emit(ForgotPasswordValidState());
      }
    });
    on<ForgotPasswordSubmittedEvent>((event, emit) {
      emit(ForgotPasswordLoadingState());
    });
  }
}
