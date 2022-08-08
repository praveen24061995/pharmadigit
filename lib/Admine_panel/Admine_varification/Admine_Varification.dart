import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Responsive/Responsiv.dart';

class AdminVarification extends StatefulWidget {
  const AdminVarification({super.key});

  @override
  State<AdminVarification> createState() => _AdminVarificationState();
}

class _AdminVarificationState extends State<AdminVarification> {
  OtpFieldController otpController = OtpFieldController();
  var w;
  var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          (Responsive.isDesktop(context)) ? h * 0.1 : h * 0.05,
                    ),
                    Center(
                      child: Text(
                        "PharmaDigits",
                        style: TextStyle(
                          fontSize: (Responsive.isDesktop(context)) ? 38 : 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Verification",
                        style: TextStyle(
                            fontSize: (Responsive.isDesktop(context)) ? 35 : 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff706F6F)),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.045,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("One time password is sent to your ",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff706F6F))),
                    ),
                    SizedBox(
                      height: h * 0.008,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          "mobile number (+91- 5555585858)/ email (abc@gmail.com)",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff706F6F))),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: (Responsive.isDesktop(context))
                              ? w * 0.001
                              : w * 0.0),
                      child: Center(
                        child: OTPTextField(
                            controller: otpController,
                            length: 6,
                            width: (Responsive.isDesktop(context))
                                ? w * 0.45
                                : w * 0.90,
                            textFieldAlignment: (Responsive.isDesktop(context))
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.spaceBetween,
                            fieldWidth: 45,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 15,
                            style: TextStyle(fontSize: 17),
                            onChanged: (pin) {
                              print("Changed: " + pin);
                            },
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                            }),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/AdmineForgotPass');
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //     '/resetpassword', (route) => false);
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
                            color: Color(0xff80B5AE)),
                        child: Center(child: Text("VERIFY")),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
