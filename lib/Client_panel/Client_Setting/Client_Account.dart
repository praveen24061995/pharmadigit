import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class ClientAccount extends StatefulWidget {
  const ClientAccount({super.key});

  @override
  State<ClientAccount> createState() => _ClientAccountState();
}

class _ClientAccountState extends State<ClientAccount> {
  var w;
  var h;
  List<String> _locations = [
    'Pharmaceutical',
    'Life',
    'Science',
    'Chemical',
    'Insurance',
    'Banking & Finance',
  ];
  String? _selected;
  List<String> _locations1 = [
    'Customer',
    'Investor',
    'Partner',
    'Supplier',
    'Vendor',
    'Distributor',
    'Consultant',
    'Service',
    'Provider',
    'KOL',
    'Competitor',
    '“TBD”',
  ];
  String? _selected1;
  List<String> _locations2 = [
    'Government',
    'Pharmacy',
    'Clinic',
    'Hospital',
    'Community',
    ' Center',
    ' NGO',
    'OTC',
    'Market',
    'Retail',
    'Chain',
    'NA',
  ];
  String? _selected2;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: w * 0.01,
                    right: (Responsive.isDesktop(context))
                        ? w * 0.131
                        : w * 0.005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Industry",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: w * .002),
                      child: Text(
                        "Account Group",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "Account Subgroup",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * 0.01),
                    height: h * 0.06,
                    width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.5),
                        color: Color(0xffFFFFFF)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,

                        hint: Text('Select'), // Not necessary for Option 1
                        value: _selected,
                        onChanged: (newValue) {
                          setState(() {
                            _selected = newValue;
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
                    height: h * 0.06,
                    width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.5),
                        color: Color(0xffFFFFFF)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,

                        hint: Text('Select'), // Not necessary for Option 1
                        value: _selected1,
                        onChanged: (newValue) {
                          setState(() {
                            _selected1 = newValue;
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
                    margin: EdgeInsets.only(right: w * 0.01),
                    height: h * 0.06,
                    width: (Responsive.isDesktop(context)) ? w * 0.2 : w * 0.31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.5),
                        color: Color(0xffFFFFFF)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,

                        hint: Text('Select'), // Not necessary for Option 1
                        value: _selected2,
                        onChanged: (newValue) {
                          setState(() {
                            _selected2 = newValue;
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
                height: h * 0.28,
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
      ),
    );
  }
}
