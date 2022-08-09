import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class AdmineUser extends StatefulWidget {
  const AdmineUser({super.key});

  @override
  State<AdmineUser> createState() => _AdmineUserState();
}

class _AdmineUserState extends State<AdmineUser> {
  List<String> _user = ['Employee', 'Contract ', 'Itern ', 'Agency', 'Guest'];
  String? _userdrop;
  List<String> _user1 = [
    'Web only without IP Restriction',
    'Web Only with IP Restrictins ',
    ' Mobile Only ',
    'Mobile & Web without IP Restrictions',
    'Mobile & Web with IP Restriction'
  ];
  String? _userdrop1;

  List<String> _user2 = [
    'Active ',
    ' Inactive ',
    'Revoked ',
  ];
  String? _userdrop2;
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
                    "User Type",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.1 : w * 0.2),
                  child: Text(
                    "User Access Type",
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
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.06),
                  child: Text(
                    "UserID Status",
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
                      hint: Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Text('Select'),
                      ),
                      value: _userdrop,
                      onChanged: (newValue) {
                        setState(() {
                          _userdrop = newValue;
                        });
                      },
                      items: _user.map((location) {
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

                      hint: Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Text('Select'),
                      ), // Not necessary for Option 1
                      value: _userdrop1,
                      onChanged: (newValue) {
                        setState(() {
                          _userdrop1 = newValue;
                        });
                      },
                      items: _user1.map((location) {
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

                      hint: Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Text('Select'),
                      ), // Not necessary for Option 1
                      value: _userdrop2,
                      onChanged: (newValue) {
                        setState(() {
                          _userdrop2 = newValue;
                        });
                      },
                      items: _user2.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.4,
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
