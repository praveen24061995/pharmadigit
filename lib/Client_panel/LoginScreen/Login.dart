import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_bloc.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_event.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_state.dart';
import 'package:pharmadigit/Responsive/Responsiv.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _uniqueidController = TextEditingController();
  var w;
  var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF4F4F4),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                Container(
                  height: (Responsive.isDesktop(context)) ? h * 0.81 : h * 0.72,
                  width: (Responsive.isDesktop(context)) ? w * 0.7 : w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/triangle.png",
                          ),
                          fit: BoxFit.fill)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * 0.06,
                        ),
                        Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 35 : 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff706F6F)),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginErrorState) {
                              return Center(
                                child: Text(
                                  state.errorMessage,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        SizedBox(
                          height: h * 0.035,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: (Responsive.isDesktop(context))
                                ? w * 0.2
                                : w * 0.1,
                          ),
                          child: Text(
                            "Organization Unique ID",
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 18 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA7A7A7)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              right: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              top: (Responsive.isDesktop(context))
                                  ? w * 0.01
                                  : w * 0.01),
                          child: TextFormField(
                            controller: _uniqueidController,
                            onChanged: (val) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _uniqueidController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Enter here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              top: h * 0.015),
                          child: Text(
                            "User Id",
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 18 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA7A7A7)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              right: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              top: (Responsive.isDesktop(context))
                                  ? w * 0.01
                                  : w * 0.02),
                          child: TextFormField(
                            controller: _emailController,
                            onChanged: (val) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _uniqueidController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Enter here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              top: h * 0.015),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 18 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA7A7A7)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              right: (Responsive.isDesktop(context))
                                  ? w * 0.2
                                  : w * 0.1,
                              top: (Responsive.isDesktop(context))
                                  ? w * 0.01
                                  : w * 0.02),
                          child: TextFormField(
                            controller: _passwordController,
                            onChanged: (val) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginTextChangedEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                      _uniqueidController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: (Responsive.isDesktop(context))
                                    ? h * 0.01
                                    : h * 0.01,
                                right: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.1),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/forgotpass');
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     '/forgotpass', (route) => false);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 18
                                        : 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff249CB7)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/ClientDashboard');

                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     '/homeResponsive', (route) => false);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: (Responsive.isDesktop(context))
                                        ? w * 0.2
                                        : w * 0.11),
                                height: (Responsive.isDesktop(context))
                                    ? h * 0.06
                                    : h * 0.06,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.3
                                    : w * 0.79,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (state is LoginValidState)
                                      ? Color(0xff249CB7)
                                      : Colors.grey,
                                ),
                                child: Center(child: Text("Login")),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
