import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class AdmineLead extends StatefulWidget {
  const AdmineLead({super.key});

  @override
  State<AdmineLead> createState() => _AdmineLeadState();
}

class _AdmineLeadState extends State<AdmineLead> {
  List<String> _locations = [
    'Online',
    'Batch-upload',
    'Manual- Input',
  ];
  String? _selectedLocation;
  List<String> _locations1 = [
    'Campagin',
    'Event',
    'Trade Show',
    'Website',
    'User Partner',
    'Referral Existing',
    'Customer',
    'Agency Other'
  ];
  String? _select;
  List<String> _locations2 = [
    'Individual',
    'Company',
  ];
  String? _selected;
  List<String> _locations3 = [
    'WIP ',
    ' Qualified-Opportunity',
    ' Qualified-NonCustomer',
    'Unqualified'
  ];
  String? _selected1;

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
                    "Lead Capture Method",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.032
                          : w * 0.025),
                  child: Text(
                    "Lead Source",
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
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.15),
                  child: Text(
                    "Lead Type",
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
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locations.map((location) {
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
                      value: _select,
                      onChanged: (newValue) {
                        setState(() {
                          _select = newValue;
                        });
                      },
                      items: _locations1.map((location1) {
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

                      hint: Padding(
                        padding: EdgeInsets.only(left: w * 0.01),
                        child: Text('Select'),
                      ), // Not necessary for Option 1
                      value: _selected,
                      onChanged: (newValue) {
                        setState(() {
                          _selected = newValue;
                        });
                      },
                      items: _locations2.map((location2) {
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
              height: h * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: Text(
                "Lead Qualification Status",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
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
                  ), // Not necessary for Option 1
                  value: _selected1,
                  onChanged: (newValue) {
                    setState(() {
                      _selected1 = newValue;
                    });
                  },
                  items: _locations3.map((location3) {
                    return DropdownMenuItem(
                      child: new Text(location3),
                      value: location3,
                    );
                  }).toList(),
                ),
              ),
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
