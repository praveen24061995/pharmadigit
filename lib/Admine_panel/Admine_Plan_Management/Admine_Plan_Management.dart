import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Setting/Admine_Responsiv_Setting.dart';

class AdminePlanManagement extends StatefulWidget {
  const AdminePlanManagement({super.key});

  @override
  State<AdminePlanManagement> createState() => _AdminePlanManagementState();
}

class _AdminePlanManagementState extends State<AdminePlanManagement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var w;
  var h;
  bool setting = true;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        drawer: AdmineDrawer(),
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                                    Navigator.pushNamed(
                                        context, '/AdmineSetting');
                                    setState(() {
                                      setting = !setting;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.settings,
                                    color: setting
                                        ? Colors.grey
                                        : Color(0xff80B5AE),
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
                        height: h * 0.09,
                        width: w * 0.8,
                        color: Color(0xffF4F4F4),
                        child: Row(
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
                            Container(
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdmineSettingResponsive(),
                                      ));
                                  setState(() {
                                    setting = !setting;
                                  });
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color:
                                      setting ? Colors.grey : Color(0xff80B5AE),
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
                      )
              ],
            ),
            SizedBox(
              height: (Responsive.isDesktop(context)) ? h * 0.008 : 0.0,
            ),
            Container(
              height: h,
              color: Color(0xffF4F4F4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.1,
                    width: (Responsive.isDesktop(context)) ? w * 0.9 : w,
                    color: Color(0xffF4F4F4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.01),
                          child: Text(
                            "Module List",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 23 : 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: (Responsive.isDesktop(context))
                                      ? w * 0.01
                                      : w * 0.030,
                                  left: (Responsive.isDesktop(context))
                                      ? w * 0.0
                                      : w * 0.002),
                              child: InkWell(
                                onTap: () {
                                  openAlertBox();
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) {
                                  //       return AlertDialog(
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(32.0))),
                                  //         contentPadding:
                                  //             EdgeInsets.only(top: 10.0),
                                  //         content: Container(
                                  //           width: 300.0,
                                  //           child: Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.start,
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.stretch,
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: <Widget>[
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceEvenly,
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.min,
                                  //                 children: <Widget>[
                                  //                   Text(
                                  //                     "Rate",
                                  //                     style: TextStyle(
                                  //                         fontSize: 24.0),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //               SizedBox(
                                  //                 height: 5.0,
                                  //               ),
                                  //               Divider(
                                  //                 color: Colors.grey,
                                  //                 height: 4.0,
                                  //               ),
                                  //               Padding(
                                  //                 padding: EdgeInsets.only(
                                  //                     left: 30.0, right: 30.0),
                                  //                 child: TextField(
                                  //                   decoration: InputDecoration(
                                  //                     hintText: "Add Review",
                                  //                     border: InputBorder.none,
                                  //                   ),
                                  //                   maxLines: 8,
                                  //                 ),
                                  //               ),
                                  //               InkWell(
                                  //                 child: Container(
                                  //                   padding: EdgeInsets.only(
                                  //                       top: 20.0,
                                  //                       bottom: 20.0),
                                  //                   decoration: BoxDecoration(
                                  //                     color: Colors.red,
                                  //                     borderRadius:
                                  //                         BorderRadius.only(
                                  //                             bottomLeft: Radius
                                  //                                 .circular(
                                  //                                     32.0),
                                  //                             bottomRight: Radius
                                  //                                 .circular(
                                  //                                     32.0)),
                                  //                   ),
                                  //                   child: Text(
                                  //                     "Rate Product",
                                  //                     style: TextStyle(
                                  //                         color: Colors.white),
                                  //                     textAlign:
                                  //                         TextAlign.center,
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       );
                                  //     });
                                },
                                child: Container(
                                  height: h * 0.06,
                                  width: (Responsive.isDesktop(context))
                                      ? w * 0.11
                                      : w * 0.28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffFFFFFFF)),
                                  child: Center(
                                    child: Text(
                                      "Create Module",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff757575),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: (Responsive.isDesktop(context))
                                      ? w * 0.01
                                      : w * 0.02),
                              child: Container(
                                height: h * 0.06,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.11
                                    : w * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFFFFFF),
                                ),
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: (Responsive.isDesktop(context))
                                      ? w * 0.005
                                      : w * 0.007),
                              child: Container(
                                height: h * 0.06,
                                width: (Responsive.isDesktop(context))
                                    ? w * 0.03
                                    : w * 0.055,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Center(
                                  child: Icon(Icons.tune),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xffC1C1C1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.01,
                        left: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008,
                        right: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Module Name",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 16 : 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Module ID",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 16 : 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Action",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 16 : 12,
                                fontWeight: FontWeight.w700,
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
                    padding: EdgeInsets.only(
                        top: h * 0.01,
                        left: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008,
                        right: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Leads",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "XYZ",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(child: Icon(Icons.visibility)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.01,
                        left: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008,
                        right: (Responsive.isDesktop(context))
                            ? w * 0.005
                            : w * 0.008),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Opportunity",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "ABC",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(child: Icon(Icons.visibility)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.01, left: w * 0.005, right: w * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "Contacts  ",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(
                            child: Text(
                              "DEF  ",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.05,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.18
                              : w * 0.3,
                          color: Color(0xffFFFFFFF),
                          child: Center(child: Icon(Icons.visibility)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
            backgroundColor: Color(0xffD9D9D9),
            content: Container(
              width: (Responsive.isDesktop(context)) ? 600 : 300.0,
              height: (Responsive.isDesktop(context)) ? h * 0.5 : h * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Create Module",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 22.0 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  SizedBox(
                    height:
                        (Responsive.isDesktop(context)) ? h * 0.08 : h * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.01),
                    child: Text(
                      "Module Name",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 18 : 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
                    height: h * 0.067,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.01),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Write here",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.04,
                        width: (Responsive.isDesktop(context))
                            ? w * 0.08
                            : w * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffECECEC),
                        ),
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 20 : 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: h * 0.04,
                        width: (Responsive.isDesktop(context))
                            ? w * 0.08
                            : w * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffFFFFFFF),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 20 : 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
