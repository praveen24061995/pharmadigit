import 'package:bloc/bloc.dart';
import 'package:pharmadigit/Admine_panel/Admine_Resset_Pass/bloc/Admine_RessetPassword_event.dart';
import 'package:pharmadigit/Admine_panel/Admine_Resset_Pass/bloc/Admine_Resset_password_state.dart';

class AdmineRessetPasswordBloc
    extends Bloc<AdmineRessetPasswordEvent, AdmineRessetPasswordState> {
  AdmineRessetPasswordBloc() : super(AdmineRessetPasswordInitialState()) {
    on<AdmineRessetPasswordTextChangedEvent>((event, emit) {
      if (event.newpassword.length < 8) {
        emit(AdmineRessetPasswordErrorState("please enter a valid password"));
      } else if (event.retypepassword.length < 8) {
        emit(AdmineRessetPasswordErrorState("Please enter a valid password"));
      } else if (event.otp.length < 6) {
        emit(AdmineRessetPasswordErrorState("Please enter valid otp"));
      } else {
        emit(AdmineRessetPasswordValidState());
      }
    });
    on<AdmineRessetPasswordSubmittedEvent>((event, emit) {
      emit(AdmineRessetPasswordLoadingState());
    });
  }
}
