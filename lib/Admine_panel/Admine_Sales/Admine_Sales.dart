import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class AdmineSales extends StatefulWidget {
  const AdmineSales({super.key});

  @override
  State<AdmineSales> createState() => _AdmineSalesState();
}

class _AdmineSalesState extends State<AdmineSales> {
  List<String> _sales = [
    'Draft',
    'Awaiting Approval',
    'Approved',
    'Rejected',
    'Sent To Prospect'
  ];
  String? _drop;
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
            Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: Text(
                "Sales Quote Status",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
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
                  ),
                  value: _drop,
                  onChanged: (newValue) {
                    setState(() {
                      _drop = newValue;
                    });
                  },
                  items: _sales.map((location) {
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
