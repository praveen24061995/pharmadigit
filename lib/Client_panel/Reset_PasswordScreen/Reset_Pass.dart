import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Responsive/Responsiv.dart';
import 'bloc/Reset_pass_bloc.dart';
import 'bloc/Reset_pass_event.dart';
import 'bloc/Reset_pass_state.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _retypepasswordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
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
                            "Reset Password",
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
                        BlocBuilder<RessetPasswordBloc, RessetPasswordState>(
                          builder: (context, state) {
                            if (state is RessetPasswordErrorState) {
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
                            "New Password",
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
                            controller: _newpasswordController,
                            onChanged: (val) {
                              BlocProvider.of<RessetPasswordBloc>(context).add(
                                  RessetPasswordTextChangedEvent(
                                      _newpasswordController.text,
                                      _retypepasswordController.text,
                                      _otpController.text));
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
                            "Rey-type Password",
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
                            controller: _retypepasswordController,
                            onChanged: (val) {
                              BlocProvider.of<RessetPasswordBloc>(context).add(
                                  RessetPasswordTextChangedEvent(
                                      _newpasswordController.text,
                                      _retypepasswordController.text,
                                      _otpController.text));
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
                            "Verify OTP",
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
                            controller: _otpController,
                            onChanged: (val) {
                              BlocProvider.of<RessetPasswordBloc>(context).add(
                                  RessetPasswordTextChangedEvent(
                                      _newpasswordController.text,
                                      _retypepasswordController.text,
                                      _otpController.text));
                            },
                            decoration: InputDecoration(
                              hintText: "Enter here",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        BlocBuilder<RessetPasswordBloc, RessetPasswordState>(
                          builder: (context, state) {
                            if (state is RessetPasswordLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/varification');

                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     '/varification', (route) => false);
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
                                  color: (state is RessetPasswordValidState)
                                      ? Color(0xff249CB7)
                                      : Colors.grey,
                                ),
                                child: Center(child: Text("Reset Password")),
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
