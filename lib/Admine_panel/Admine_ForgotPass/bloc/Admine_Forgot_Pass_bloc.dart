import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pharmadigit/Admine_panel/Admine_ForgotPass/bloc/Admine_Forgot_pass_event.dart';
import 'package:pharmadigit/Admine_panel/Admine_ForgotPass/bloc/Admine_Forgot_pass_state.dart';

class AdmineForgotPasswordBloc
    extends Bloc<AdmineForgotPasswordEvent, AdmineForgotPasswordState> {
  AdmineForgotPasswordBloc() : super(AdmineForgotPasswordInitialState()) {
    on<AdmineForgotPasswordTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(AdmineForgotPasswordErrorState(
            "please enter a valid email addres"));
      } else {
        emit(AdmineForgotPasswordValidState());
      }
    });
    on<AdmineForgotPasswordSubmittedEvent>((event, emit) {
      emit(AdmineForgotPasswordLoadingState());
    });
  }
}
