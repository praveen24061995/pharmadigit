import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class AdmineOpportunity extends StatefulWidget {
  const AdmineOpportunity({super.key});

  @override
  State<AdmineOpportunity> createState() => _AdmineOpportunityState();
}

class _AdmineOpportunityState extends State<AdmineOpportunity> {
  List<String> _opportunitydropdown1 = [
    'Online',
    'Batch-upload',
    'Manual- Input',
    'Converted-Lead'
  ];
  String? _dropdown1;
  List<String> _opportunitydropdown2 = [
    'Converted-Lead ',
    'Existing-Business',
  ];
  String? _dropdown2;
  List<String> _opportunitydropdown3 = [
    'Converted-Lead ',
    'Existing-Business',
  ];
  String? _dropdown3;
  List<String> _opportunitydropdown4 = [
    'Sales',
    'Services',
    'Support',
  ];
  String? _dropdown4;

  List<String> _opportunitydropdown5 = [
    'Negotiation',
    'Won',
    'Lost',
    'Hold',
    'Withdrawn'
  ];
  String? _dropdown5;

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
                    (Responsive.isDesktop(context))
                        ? "Opportunity Capture Method"
                        : "Opp. Capture Method",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (Responsive.isDesktop(context))
                          ? w * 0.038
                          : w * 0.025),
                  child: Text(
                    (Responsive.isDesktop(context))
                        ? "Opportunity Source"
                        : "Opp.Source",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.155 : w * 0.0,
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.17),
                  child: Text(
                    (Responsive.isDesktop(context))
                        ? "Opportunity Type"
                        : "Opp.Type",
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
                      value: _dropdown1,
                      onChanged: (newValue) {
                        setState(() {
                          _dropdown1 = newValue;
                        });
                      },
                      items: _opportunitydropdown1.map((location) {
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
                          : w * 0.025,
                      right:
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.0),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,

                      hint: Text('Select'), // Not necessary for Option 1
                      value: _dropdown2,
                      onChanged: (newValue) {
                        setState(() {
                          _dropdown2 = newValue;
                        });
                      },
                      items: _opportunitydropdown2.map((location) {
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
                      right: (Responsive.isDesktop(context)) ? w * 0.02 : w * 0,
                      left:
                          (Responsive.isDesktop(context)) ? w * 0.0 : w * 0.04),
                  height: h * 0.06,
                  width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: Color(0xffFFFFFF)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Select'),
                      value: _dropdown4,
                      onChanged: (newValue) {
                        setState(() {
                          _dropdown4 = newValue;
                        });
                      },
                      items: _opportunitydropdown4.map((location) {
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
              height: h * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: Text(
                "Deal Status",
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
              width: w * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.5),
                  color: Color(0xffFFFFFF)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,

                  hint: Text('Select'), // Not necessary for Option 1
                  value: _dropdown5,
                  onChanged: (newValue) {
                    setState(() {
                      _dropdown5 = newValue;
                    });
                  },
                  items: _opportunitydropdown5.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
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
