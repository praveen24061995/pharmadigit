import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Setting/Admine_Responsiv_Setting.dart';

class AdmineListPlan extends StatefulWidget {
  const AdmineListPlan({super.key});

  @override
  State<AdmineListPlan> createState() => _AdmineListPlanState();
}

class _AdmineListPlanState extends State<AdmineListPlan> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var w;
  var h;
  bool setting = false;
  @override
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
                      "List of Plan",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 25 : 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(right: w * 0.01),
                      //   height: h * 0.065,
                      //   width: (Responsive.isDesktop(context))
                      //       ? w * 0.08
                      //       : w * 0.15,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       color: Color(0xffFFFFFFF)),
                      //   child: Center(
                      //     child: Text(
                      //       "Add Plan",
                      //       style: TextStyle(
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w500,
                      //         color: Color(0xff757575),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: (Responsive.isDesktop(context))
                                ? w * 0.01
                                : w * 0.02),
                        child: Container(
                          height: h * 0.065,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.14
                              : (Responsive.isDesktop(context))
                                  ? w * 0.4
                                  : w * 0.52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Search",
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
                          margin: EdgeInsets.only(right: w * 0.01),
                          height: h * 0.06,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.03
                              : w * 0.07,
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
              Center(
                child: Container(
                  height: h,
                  width: w,
                  color: Color(0xffF4F4F4),
                  child: DataTable2(
                      // columnSpacing: 12,
                      // horizontalMargin: 12,
                      // minWidth: 600,
                      columns: [
                        DataColumn2(
                          label: Text(
                            'Sr.No.',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575)),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text(
                            'Plan id',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575)),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Plan Type',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575)),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Plan Price (User/Month)',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff757575)),
                          ),
                        ),
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(left: w * 0.05),
                            child: Text(
                              'Action',
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff757575)),
                            ),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          1,
                          (index) => DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('123486')),
                                DataCell(Text('Gold')),
                                DataCell(Center(child: Text('10'))),
                                DataCell(Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: Color(0xff000000),
                                        ),
                                        Text(
                                          "/",
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                        Icon(
                                          Icons.delete,
                                          color: Color(0xff757575),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
