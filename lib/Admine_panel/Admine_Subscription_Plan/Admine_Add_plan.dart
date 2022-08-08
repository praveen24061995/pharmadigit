import 'dart:async';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Setting/Admine_Responsiv_Setting.dart';

class AdmineAddPlan extends StatefulWidget {
  const AdmineAddPlan({super.key});

  @override
  State<AdmineAddPlan> createState() => _AdmineAddPlanState();
}

class _AdmineAddPlanState extends State<AdmineAddPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownvalue = 'English';
  var items = [
    'English',
    'Vietnamese',
  ];

  var birthDate = '';
  var w;
  var h;
  bool setting = false;
  var checkBoxValue = false;
  var checkBoxValue1 = false;
  var checkBoxValue2 = false;
  var checkBoxValue3 = false;
  var checkBoxValue4 = false;
  var checkBoxValue5 = false;
  var checkBoxValue6 = false;
  var checkBoxValue7 = false;
  var checkBoxValue8 = false;
  var checkBoxValue9 = false;
  var checkBoxValue10 = false;
  var checkBoxValue11 = false;
  var checkBoxValue12 = false;
  var checkBoxValue13 = false;
  var checkBoxValue14 = false;
  var checkBoxValue15 = false;
  var checkBoxValue16 = false;
  var checkBoxValue17 = false;
  var checkBoxValue18 = false;
  var checkBoxValue19 = false;
  var checkBoxValue20 = false;

  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F4F4),
        drawer: AdmineDrawer(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: (!Responsive.isDesktop(context))
                    ? Color(0xffFFFFFFF)
                    : Color(0xffF4F4F4),
                child: Row(
                  children: [
                    (!Responsive.isDesktop(context))
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.menu),
                                    onPressed: () {
                                      _scaffoldKey.currentState!.openDrawer();
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: w * 0.21),
                                    height: 25,
                                    width: 25,
                                    color: Color(0xffE31D1C),
                                    child: Center(
                                      child: Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Color(0xffFFD221),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.expand_more,
                                        color: Color(0xff7C7C7C),
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.notification_add,
                                        color: Color(0xff80B5AE),
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          setting = !setting;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdmineSettingResponsive(),
                                            ));
                                        // Navigator.pushNamed(
                                        //     context, '/AdmineSetting');
                                      },
                                      icon: Icon(
                                        Icons.settings,
                                        color: setting
                                            ? Color(0xff80B5AE)
                                            : Colors.grey,
                                      )),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0xffD9D9D9),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.person,
                                        color: Color(0xffFFFFFF),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.expand_more,
                                        color: Color(0xff7C7C7C),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: w * 0.04,
                                    right: w * 0.02,
                                    bottom: h * 0.02),
                                height: 50,
                                width: w * 0.92,
                                color: Color(0xffFFFFFF),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.search),
                                        onPressed: () {},
                                      ),
                                      border: OutlineInputBorder(),
                                      fillColor: Color(0xffECECEC)),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            margin: EdgeInsets.only(top: h * 0.015),
                            height: h * 0.1,
                            width: w * 0.8,
                            color: Color(0xffF4F4F4),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: h * 0.06,
                                      width: w * 0.21,
                                      color: Color(0xffFFFFFF),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: () {},
                                            ),
                                            border: OutlineInputBorder(),
                                            fillColor: Color(0xffECECEC)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        DropdownButton<String>(
                                          hint: Text("chooselanguage"),
                                          value: dropdownvalue,
                                          dropdownColor: Colors.white,
                                          focusColor: Colors.white,
                                          // Down Arrow Icon

                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 30,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                            if (dropdownvalue == "English") {
                                              context.locale =
                                                  Locale("en", "US");
                                            } else if (dropdownvalue ==
                                                "'Vietnamese'") {
                                              context.locale =
                                                  Locale("vt", "US");
                                            }
                                          },
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 13),
                                        height: 30,
                                        width: 30,
                                        color: Color(0xffE31D1C),
                                        child: Center(
                                          child: Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Color(0xffFFD221),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.expand_more,
                                          color: Color(0xff7C7C7C),
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.notification_add,
                                          color: Color(0xff80B5AE),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            setting = !setting;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AdmineSettingResponsive(),
                                              ));
                                        },
                                        icon: Icon(
                                          Icons.settings,
                                          color: setting
                                              ? Color(0xff80B5AE)
                                              : Colors.grey,
                                        )),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Color(0xffD9D9D9),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.person,
                                          color: Color(0xffFFFFFF),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.expand_more,
                                          color: Color(0xff7C7C7C),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.009,
                                ),
                                Divider(
                                  thickness: 5.5,
                                  color: Color(0xffFFFFFF),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: (Responsive.isDesktop(context)) ? h * 0.01 : h * 0.0,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.01),
                    child: Text(
                      "Add Plan",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 25 : 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: (Responsive.isDesktop(context))
                  //               ? w * 0.01
                  //               : w * 0.02),
                  //       child: Container(
                  //         height: h * 0.065,
                  //         width: (Responsive.isDesktop(context))
                  //             ? w * 0.14
                  //             : (Responsive.isDesktop(context))
                  //                 ? w * 0.4
                  //                 : w * 0.52,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: Color(0xffFFFFFF),
                  //         ),
                  //         child: TextFormField(
                  //           decoration: InputDecoration(
                  //               hintText: "Search",
                  //               suffixIcon: IconButton(
                  //                 icon: Icon(Icons.search),
                  //                 onPressed: () {},
                  //               ),
                  //               border: OutlineInputBorder(),
                  //               fillColor: Color(0xffECECEC)),
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           right: (Responsive.isDesktop(context))
                  //               ? w * 0.005
                  //               : w * 0.007),
                  //       child: Container(
                  //         margin: EdgeInsets.only(right: w * 0.01),
                  //         height: h * 0.06,
                  //         width: (Responsive.isDesktop(context))
                  //             ? w * 0.03
                  //             : w * 0.07,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: Color(0xffFFFFFF),
                  //         ),
                  //         child: Center(
                  //           child: Icon(Icons.tune),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffC1C1C1),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plan ID",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 18 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: w * 0.0,
                          left: (Responsive.isDesktop(context))
                              ? w * 0.01
                              : w * 0.05),
                      child: Text(
                        "Plan Title",
                        style: TextStyle(
                          fontSize: (Responsive.isDesktop(context)) ? 18 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: (Responsive.isDesktop(context))
                              ? w * 0.08
                              : w * 0.13),
                      child: Text(
                        (Responsive.isDesktop(context))
                            ? "Plan Price (User/Month)"
                            : "Plan Price ",
                        style: TextStyle(
                          fontSize: (Responsive.isDesktop(context)) ? 18 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.01, right: w * 0.01, top: h * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.07,
                      width:
                          (Responsive.isDesktop(context)) ? w * 0.21 : w * 0.31,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.01, top: h * 0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Write here",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.07,
                      width:
                          (Responsive.isDesktop(context)) ? w * 0.21 : w * 0.31,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.01, top: h * 0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Write here",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.07,
                      width:
                          (Responsive.isDesktop(context)) ? w * 0.21 : w * 0.31,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.01, top: h * 0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Write here",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: w * 0.0, left: w * 0.01),
                    child: Text(
                      "Plan Duration",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 18 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: (Responsive.isDesktop(context))
                            ? w * 0.305
                            : w * 0.18),
                    child: Text(
                      "Plan Description",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 18 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(right: w * 0.0, left: w * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.07,
                      width:
                          (Responsive.isDesktop(context)) ? w * 0.38 : w * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: w * 0.01, top: h * 0.005),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              birthDate,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xffC1C1C1),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: w * 0.01,
                      ),
                      height: h * 0.07,
                      width:
                          (Responsive.isDesktop(context)) ? w * 0.38 : w * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.01, top: h * 0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Write here",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.01),
                child: Text(
                  "Modules",
                  style: TextStyle(
                    fontSize: (Responsive.isDesktop(context)) ? 20 : 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffC1C1C1),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              (Responsive.isDesktop(context))
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.015
                                  : w * 0.001),
                          height: h * 0.38,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.2
                              : w * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue = !checkBoxValue;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Leads",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue1,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue1 = !checkBoxValue1;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Opportunity",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue2,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue2 = !checkBoxValue2;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue3,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue3 = !checkBoxValue3;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Address",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue4,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue4 = !checkBoxValue4;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Account",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue5,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue5 = !checkBoxValue5;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Campaign",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue6,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue6 = !checkBoxValue6;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "System User",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: (Responsive.isDesktop(context))
                                  ? w * 0.015
                                  : w * 0.001),
                          height: h * 0.38,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.2
                              : w * 0.34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue7,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue7 = !checkBoxValue7;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.000),
                                      child: Text(
                                        "Company",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue8,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue8 = !checkBoxValue8;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Sales Modules",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue9,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue9 = !checkBoxValue9;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Survey and Forms",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue10,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue10 = !checkBoxValue10;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Knowledgebase",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue11,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue11 = !checkBoxValue11;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Communication",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue12,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue12 = !checkBoxValue12;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Expense Management",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue13,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue13 = !checkBoxValue13;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.00),
                                      child: Text(
                                        "Training",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: w * 0.015, right: w * 0.01),
                          height: h * 0.38,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.2
                              : w * 0.27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.2
                                    : w * 0.03,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue14,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue14 = !checkBoxValue14;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Leave Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue15,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue15 = !checkBoxValue15;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Analytics & Reports",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue16,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue16 = !checkBoxValue16;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Approval Process",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue17,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue17 = !checkBoxValue17;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Access Control",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue18,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue18 = !checkBoxValue18;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Audit Trail",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue19,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue19 = !checkBoxValue19;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Sales Route Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue20,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue20 = !checkBoxValue20;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Work Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: w * 0.015),
                                height: h * 0.37,
                                width: w * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue =
                                                      !checkBoxValue;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Leads",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue1,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue1 =
                                                      !checkBoxValue1;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Opportunity",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue2,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue2 =
                                                      !checkBoxValue2;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Contact",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue3,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue3 =
                                                      !checkBoxValue3;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Address",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue4,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue4 =
                                                      !checkBoxValue4;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Account",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue5,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue5 =
                                                      !checkBoxValue5;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "Campaign",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue6,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue6 =
                                                      !checkBoxValue6;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.01),
                                            child: Text(
                                              "System User",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: w * 0.001, right: w * 0.025),
                                height: h * 0.37,
                                width: w * 0.47,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue7,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue7 =
                                                      !checkBoxValue7;
                                                });
                                              }),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: w * 0.000),
                                            child: Text(
                                              "Company",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue8,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue8 =
                                                      !checkBoxValue8;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Sales Modules",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue9,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue9 =
                                                      !checkBoxValue9;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Survey and Forms",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue10,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue10 =
                                                      !checkBoxValue10;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Knowledge",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue11,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue11 =
                                                      !checkBoxValue11;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Communication",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue12,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue12 =
                                                      !checkBoxValue12;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Expense Management",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: h * 0.04,
                                      width: w * 0.45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffF4F4F4),
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              value: checkBoxValue13,
                                              activeColor: Color(0xff496763),
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBoxValue13 =
                                                      !checkBoxValue13;
                                                });
                                              }),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: w * 0.00),
                                            child: Text(
                                              "Training",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: w * 0.015, right: w * 0.01),
                          height: h * 0.37,
                          width: w * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue14,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue14 = !checkBoxValue14;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Leave Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue15,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue15 = !checkBoxValue15;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Analytics & Reports",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue16,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue16 = !checkBoxValue16;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Approval Process",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue17,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue17 = !checkBoxValue17;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Access Control",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue18,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue18 = !checkBoxValue18;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Audit Trail",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue19,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue19 = !checkBoxValue19;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Sales Route Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: h * 0.04,
                                width: w * 0.43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xffF4F4F4),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: checkBoxValue20,
                                        activeColor: Color(0xff496763),
                                        onChanged: (value) {
                                          setState(() {
                                            checkBoxValue20 = !checkBoxValue20;
                                          });
                                        }),
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.01),
                                      child: Text(
                                        "Work Planning",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: h * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: h * 0.05,
                    width: (Responsive.isDesktop(context)) ? w * 0.1 : w * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5),
                      color: Color(0xffECECEC),
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.05,
                    width: (Responsive.isDesktop(context)) ? w * 0.1 : w * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String date = "";
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? birthselected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(3025),
      fieldHintText: "DATE/MONTH/YEAR",
    );
    if (birthselected != null && birthselected != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = birthselected;
        birthDate =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }
}
