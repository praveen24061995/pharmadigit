import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Responsive/Responsiv.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var w;
  var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
                    height: h * 0.1,
                  ),
                  Center(
                    child: Text("WELCOME TO PHARMADIGITS",
                        style: TextStyle(
                          fontSize: Responsive.isDesktop(context) ? 25 : 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            Responsive.isDesktop(context) ? w * 0.12 : w * 0.1,
                        right:
                            Responsive.isDesktop(context) ? w * 0.12 : w * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Super Admin Login",
                          style: TextStyle(
                            fontSize: Responsive.isDesktop(context) ? 18 : 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Client Login",
                          style: TextStyle(
                            fontSize: Responsive.isDesktop(context) ? 18 : 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left:
                            Responsive.isDesktop(context) ? w * 0.15 : w * 0.1,
                        right:
                            Responsive.isDesktop(context) ? w * 0.13 : w * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff80B5AE)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/Adminelogin');
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff80B5AE)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/Clientlogin');
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
