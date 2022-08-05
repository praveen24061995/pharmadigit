import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';

class ClientCompany extends StatefulWidget {
  const ClientCompany({super.key});

  @override
  State<ClientCompany> createState() => _ClientCompanyState();
}

class _ClientCompanyState extends State<ClientCompany> {
  var birthDate = '';
  String radioButtonItem = 'ONE';
  int id = 1;

  List<String> _locations3 = [
    'Hanoi',
    'Saigon',
    'Dalat',
    'North',
    'South',
    'Central',
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
        body: SingleChildScrollView(
          child: Column(
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
                      "Head Office",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (Responsive.isDesktop(context))
                            ? w * 0.0
                            : w * 0.12),
                    child: Text(
                      "Time Zone",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: (Responsive.isDesktop(context))
                            ? w * 0.169
                            : w * 0.0,
                        left: (Responsive.isDesktop(context))
                            ? w * 0.0
                            : w * 0.19),
                    child: Text(
                      "Business Hour",
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
              Padding(
                padding: EdgeInsets.only(
                    left:
                        (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.001,
                    right:
                        (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.001),
                child: Row(
                  mainAxisAlignment: (Responsive.isDesktop(context))
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                  ],
                ),
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
                    padding: EdgeInsets.only(
                      left: w * 0.02,
                    ),
                    child: Text(
                      "Date Formate",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (Responsive.isDesktop(context))
                            ? w * 0.0
                            : w * 0.12),
                    child: Text(
                      "Financial Year",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: (Responsive.isDesktop(context))
                            ? w * 0.169
                            : w * 0.00,
                        left: (Responsive.isDesktop(context))
                            ? w * 0.0
                            : w * 0.1),
                    child: Text(
                      "Business Hour",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.01,
                    right:
                        (Responsive.isDesktop(context)) ? w * 0.02 : w * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                      height: h * 0.065,
                      width: (Responsive.isDesktop(context))
                          ? w * 0.21
                          : w * 0.325,
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
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: Row(
                  children: [
                    Text(
                      "Lead Qualification Status",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: (Responsive.isDesktop(context))
                              ? w * 0.17
                              : w * 0.05),
                      child: Text(
                        "IP  Address Restriction",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * 0.02),
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
                        items: _locations3.map((location3) {
                          return DropdownMenuItem(
                            child: new Text(location3),
                            value: location3,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (Responsive.isDesktop(context))
                            ? w * 0.07
                            : w * 0.12),
                    child: Text('Yes',
                        style: new TextStyle(
                            fontSize: 15.0, color: Colors.black45)),
                  ),
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'ONE';
                        id = 1;
                      });
                    },
                    activeColor: Color(0xff68CBBE),
                  ),
                  Text('No',
                      style:
                          new TextStyle(fontSize: 15.0, color: Colors.black45)),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'TWO';
                        id = 2;
                      });
                    },
                    activeColor: Color(0xff68CBBE),
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

  String date = "";
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? birthselected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
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

  String date1 = "";
  DateTime selectedDate2 = DateTime.now();

  _selectDate2(BuildContext context) async {
    final DateTime? birthselected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
      fieldHintText: "DATE/MONTH/YEAR",
    );
    if (birthselected != null && birthselected != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate2 = birthselected;
        birthDate =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }
}
