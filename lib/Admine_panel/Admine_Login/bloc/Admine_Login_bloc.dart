import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pharmadigit/Admine_panel/Admine_Login/bloc/Admine_Login_event.dart';
import 'package:pharmadigit/Admine_panel/Admine_Login/bloc/Admine_Login_state.dart';

class AdmineLoginBloc extends Bloc<AdmineLoginEvent, AdmineLoginState> {
  AdmineLoginBloc() : super(AdmineLoginInitialState()) {
    on<AdmineLoginTextChangedEvent>((event, emit) {
      // if (EmailValidator.validate(event.email) == false) {
      //   emit(AdmineLoginErrorState("please enter a valid email addres"));
      // } else if (event.password.length < 8) {
      //   emit(AdmineLoginErrorState("Please enter a valid password"));
      // } else {
      //   emit(AdmineLoginValidState());
      // }
    });
    on<AdmineLoginSubmittedEvent>((event, emit) {
      emit(AdmineLoginLoadingState());
    });
  }
}
