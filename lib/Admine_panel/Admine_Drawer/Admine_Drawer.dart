import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Responsive/Responsiv.dart';

class AdmineDrawer extends StatefulWidget {
  const AdmineDrawer({super.key});

  @override
  State<AdmineDrawer> createState() => _AdmineDrawerState();
}

class _AdmineDrawerState extends State<AdmineDrawer> {
  var w;
  var h;
  bool _isVisible = false;
  bool praveen = false;
  bool planmanagement = false;
  bool subscriptionplan = false;
  bool manageclient = false;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    print(praveen);
    print("yyyyyyyy $planmanagement");
    print(" pppppppp $subscriptionplan");
    print(" jjjjjjj $manageclient");
    return SafeArea(
        child: Container(
            width: w * 0.5,
            child: Container(
              color: Color(0xff496763),
              child: ListView(children: [
                Container(
                  height:
                      (Responsive.isDesktop(context)) ? h * 0.09 : h * 0.065,
                  color: Color(0xff5F8984),
                  child: Center(
                    child: Text(
                      "PharmaDigits",
                      style: TextStyle(
                          fontSize: (Responsive.isDesktop(context)) ? 20 : 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.0, top: h * 0.015),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/AdmineDashboard');
                      setState(() {
                        praveen = true;
                        planmanagement = false;
                        subscriptionplan = false;
                        manageclient = false;
                      });
                      // Navigator.pushNamed(context, '/homeResponsive');
                    },
                    child: Container(
                      height: h * 0.06,
                      color: praveen == true
                          ? Color(0xff68CBBE)
                          : Color(0xff496763),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.center_focus_strong,
                              size: (Responsive.isDesktop(context)) ? 15 : 12,
                              color: Color(0xffFFFFFF),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 14
                                        : 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: w * 0.00, top: h * 0.025),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/AdminePlanManagement');
                        setState(() {
                          planmanagement = true;
                          praveen = false;
                          subscriptionplan = false;
                          manageclient = false;
                        });
                      },
                      child: Container(
                        height: h * 0.06,
                        color: planmanagement == true
                            ? Color(0xff68CBBE)
                            : Color(0xff496763),
                        child: Padding(
                          padding: EdgeInsets.only(left: w * 0.01),
                          child: Row(
                            children: [
                              Icon(
                                Icons.center_focus_strong,
                                size: (Responsive.isDesktop(context)) ? 15 : 12,
                                color: Color(0xffFFFFFF),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Plan Management",
                                  style: TextStyle(
                                      fontSize: (Responsive.isDesktop(context))
                                          ? 14
                                          : 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        praveen == false;
                        planmanagement == false;
                        subscriptionplan == true;
                        manageclient == false;
                      });
                    },
                    child: Container(
                      height: h * 0.06,
                      color: subscriptionplan == true
                          ? Color(0xff68CBBE)
                          : Color(0xff496763),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.center_focus_strong,
                                size: (Responsive.isDesktop(context)) ? 15 : 12,
                                color: Color(0xffFFFFFF),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  "Subscription Plan",
                                  style: TextStyle(
                                      fontSize: (Responsive.isDesktop(context))
                                          ? 14
                                          : 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF)),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            child: Icon(
                              _isVisible == true
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              size: (Responsive.isDesktop(context)) ? 20 : 18,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.025, left: w * 0.02),
                  child: Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.01),
                          child: Row(
                            children: [
                              Icon(
                                Icons.noise_control_off,
                                color: Color(0xffFFFFFF),
                                size: (Responsive.isDesktop(context)) ? 18 : 14,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/AdmineSubscriptionPlan');
                                },
                                child: Text("Add Plan",
                                    style: TextStyle(
                                        fontSize:
                                            (Responsive.isDesktop(context))
                                                ? 14
                                                : 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.01, top: h * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/AdmineSubscriptionModifyPlan');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Modify Plan",
                                    style: TextStyle(
                                        fontSize:
                                            (Responsive.isDesktop(context))
                                                ? 14
                                                : 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF)))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.01, top: h * 0.02),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/AdmineSubscriptionListPlan');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("List of Plan",
                                    style: TextStyle(
                                        fontSize:
                                            (Responsive.isDesktop(context))
                                                ? 14
                                                : 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/AdmineManageClientResponsive');
                    },
                    child: Container(
                      height: h * 0.06,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.center_focus_strong,
                            size: (Responsive.isDesktop(context)) ? 15 : 12,
                            color: Color(0xffFFFFFF),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              "Manage Client",
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }
}
