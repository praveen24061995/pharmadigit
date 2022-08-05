import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class AdmineOther extends StatefulWidget {
  const AdmineOther({super.key});

  @override
  State<AdmineOther> createState() => _AdmineOtherState();
}

class _AdmineOtherState extends State<AdmineOther> {
  List<String> _other = [
    'Well-known',
    'Known ',
    'Not-Known ',
  ];
  String? _otherdrop;
  List<String> _other1 = [
    'Very Low ',
    'Low ',
    ' Medium High ',
    ' Very High',
  ];
  String? _otherdrop1;
  List<String> _other2 = [
    'Not-ready-to-buy  ',
    'Desired-product-not-available ',
    ' Other ',
  ];
  String? _otherdrop2;
  List<String> _other3 = [
    'Unprofitable Demand  ',
    'Unacceptable T&C ',
    ' Business-Decision ',
    ' Other',
  ];
  String? _otherdrop3;
  List<String> _other4 = [
    'Monthly  ',
    ' Quarterly ',
    ' Semi-Annually ',
    ' Annually',
  ];
  String? _otherdrop4;
  List<String> _other5 = [
    'Mr.  ',
    'Mrs. ',
    'Miss. ',
    'Dr.Hon.',
  ];
  String? _otherdrop5;
  List<String> _other6 = [
    'Active',
    'DND(Do-Not-Disturb)',
    ' NR(No-reachable)',
  ];
  String? _otherdrop6;
  List<String> _other7 = [
    'Active',
    'Inactive',
  ];
  String? _otherdrop7;
  List<String> _other8 = [
    'All ',
    'None',
    'Own',
    'Group',
  ];
  String? _otherdrop8;
  var w;
  var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Text(
                    "Brand Image",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.15),
                  child: Text(
                    "Likelihood of Purchase",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.17 : w * 0.0,
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.1 : w * 0.02),
                  child: Text(
                    "Hold Reason",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: w * 0.02),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select'),
                      value: _otherdrop,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop = newValue;
                        });
                      },
                      items: _other.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.07
                          : w * 0.025),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop1,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop1 = newValue;
                        });
                      },
                      items: _other1.map((location1) {
                        return DropdownMenuItem(
                          child: new Text(location1),
                          value: location1,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.0,
                      left: (Responsive.isDesktop(context))
                          ? w * 0.0
                          : w * 0.048),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop2,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop2 = newValue;
                        });
                      },
                      items: _other2.map((location2) {
                        return DropdownMenuItem(
                          child: new Text(location2),
                          value: location2,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Text(
                    "Withdrawal Reason",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.09
                          : w * 0.06),
                  child: Text(
                    "Revenue Goal Frequency",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.18 : w * 0.0,
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.05),
                  child: Text(
                    "Salutation",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: w * 0.02),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select'),
                      value: _otherdrop3,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop3 = newValue;
                        });
                      },
                      items: _other3.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.07
                          : w * 0.025),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop4,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop4 = newValue;
                        });
                      },
                      items: _other4.map((location1) {
                        return DropdownMenuItem(
                          child: new Text(location1),
                          value: location1,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.0,
                      left: (Responsive.isDesktop(context))
                          ? w * 0.0
                          : w * 0.025),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop5,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop5 = newValue;
                        });
                      },
                      items: _other5.map((location2) {
                        return DropdownMenuItem(
                          child: new Text(location2),
                          value: location2,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Text(
                    "Contact Status",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.07
                          : w * 0.14),
                  child: Text(
                    "Address Status",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.15 : w * 0.0,
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.08),
                  child: Text(
                    "Record Ownership",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: (Responsive.isDesktop(context))
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: w * 0.02),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select'),
                      value: _otherdrop6,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop6 = newValue;
                        });
                      },
                      items: _other6.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.07
                          : w * 0.025),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop7,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop7 = newValue;
                        });
                      },
                      items: _other7.map((location1) {
                        return DropdownMenuItem(
                          child: new Text(location1),
                          value: location1,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.0,
                      left: (Responsive.isDesktop(context))
                          ? w * 0.0
                          : w * 0.025),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _otherdrop8,
                      onChanged: (newValue) {
                        setState(() {
                          _otherdrop8 = newValue;
                        });
                      },
                      items: _other8.map((location2) {
                        return DropdownMenuItem(
                          child: new Text(location2),
                          value: location2,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.25,
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
            )
          ],
        ),
      ),
    );
  }
}
