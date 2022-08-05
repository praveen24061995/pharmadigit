import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_event.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(LoginErrorState("please enter a valid email addres"));
      } else if (event.password.length < 8) {
        emit(LoginErrorState("Please enter a valid password"));
      } else if (event.uniqueid.length < 4) {
        emit(LoginErrorState("Please enter unique id"));
      } else {
        emit(LoginValidState());
      }
    });
    on<LoginSubmittedEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
