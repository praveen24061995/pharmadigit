import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool _isVisible = false;
  bool _isVisible1 = false;
  var w;
  var h;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void product() {
    setState(() {
      _isVisible1 = !_isVisible1;
    });
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: w * 0.5,
        child: Drawer(
          child: Container(
            color: Color(0xff496763),
            child: ListView(
              children: [
                Container(
                  height:
                      (Responsive.isDesktop(context)) ? h * 0.09 : h * 0.065,
                  color: Color(0xff5F8984),
                  child: Center(
                    child: Text(
                      "Company Name",
                      style: TextStyle(
                          fontSize: (Responsive.isDesktop(context)) ? 20 : 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/homeResponsive');
                    },
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
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
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
                              "Access Control",
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showToast();
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
                Padding(
                  padding: EdgeInsets.only(top: h * 0.025, left: w * 0.02),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => NewScreen()));
                    },
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
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Users",
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.01, top: h * 0.02),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("User Groups",
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.01, top: h * 0.02),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Roles",
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
                          Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.01,
                                top: h * 0.02,
                                bottom: h * 0.015),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Permissions",
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
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.01,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/LeadsResponsive');
                    },
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
                            "Leads",
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Opportunity",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Contact",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Account",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Company",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Leave",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Batchupload",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.02),
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
                          "Address Book",
                          style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 14 : 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
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
                              "Product",
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          product();
                        },
                        child: Icon(
                          _isVisible1 == true
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: (Responsive.isDesktop(context)) ? 20 : 18,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.025, left: w * 0.02),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => NewScreen()));
                    },
                    child: Visibility(
                      visible: _isVisible1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Item  Master",
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
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.01, top: h * 0.02),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.noise_control_off,
                                  color: Color(0xffFFFFFF),
                                  size:
                                      (Responsive.isDesktop(context)) ? 18 : 14,
                                ),
                                Text("Price Master",
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
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
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
                          "Expenses",
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
                Padding(
                  padding: EdgeInsets.only(left: w * 0.01, top: h * 0.015),
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
                              "More",
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: (Responsive.isDesktop(context)) ? 20 : 18,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ],
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
