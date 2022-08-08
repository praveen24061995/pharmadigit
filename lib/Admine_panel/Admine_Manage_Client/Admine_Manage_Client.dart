import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Setting/Admine_Responsiv_Setting.dart';

class AdmineManageClient extends StatefulWidget {
  const AdmineManageClient({super.key});

  @override
  State<AdmineManageClient> createState() => _AdmineManageClientState();
}

class _AdmineManageClientState extends State<AdmineManageClient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TimeOfDay selectedTime = TimeOfDay.now();
  var w;
  var h;
  bool setting = false;
  bool isChecked = false;
  bool isChecked2 = false;
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

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
                      "Manage Client",
                      style: TextStyle(
                        fontSize: (Responsive.isDesktop(context)) ? 25 : 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          openAlertBox();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: w * 0.017),
                          height: h * 0.065,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.08
                              : w * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffFFFFFFF)),
                          child: Center(
                            child: Text(
                              "Add Client",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff757575),
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
                          height: h * 0.065,
                          width: (Responsive.isDesktop(context))
                              ? w * 0.14
                              : (Responsive.isDesktop(context))
                                  ? w * 0.4
                                  : w * 0.45,
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
                height: h * 0.001,
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
                            'Name of Client',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 15 : 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Text(
                            'Plan ID',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 15 : 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Plan',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 15 : 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 15 : 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(left: w * 0.05),
                            child: Text(
                              'Hosting Server',
                              style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 15 : 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          1,
                          (index) => DataRow(cells: [
                                DataCell(Padding(
                                  padding: EdgeInsets.only(left: w * 0.015),
                                  child: Text('Ems'),
                                )),
                                DataCell(Text('123486')),
                                DataCell(Text('Gold')),
                                DataCell(Text('Active')),
                                DataCell(Padding(
                                  padding: EdgeInsets.only(left: w * 0.052),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Shared Server",
                                      ),
                                    ],
                                  ),
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

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return (Responsive.isDesktop(context))
              ? AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  backgroundColor: Color(0xffD9D9D9),
                  content: Container(
                    width: (Responsive.isDesktop(context)) ? 980 : 350.0,
                    height: (Responsive.isDesktop(context)) ? h * 1 : h * 1,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Add Client",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 22.0 : 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        SizedBox(
                          height: (Responsive.isDesktop(context))
                              ? h * 0.01
                              : h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.0),
                          child: Row(
                            children: [
                              Text(
                                "Client logo",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: (Responsive.isDesktop(context))
                                        ? w * 0.09
                                        : w * 0.05),
                                child: Text(
                                  "Client Id",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 13
                                        : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: (Responsive.isDesktop(context))
                                        ? w * 0.21
                                        : w * 0.09),
                                child: Text(
                                  "Client Name",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 13
                                        : 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: (Responsive.isDesktop(context))
                                      ? h * 0.0
                                      : h * 0.22),
                              child: Container(
                                height: (Responsive.isDesktop(context))
                                    ? h * 0.3
                                    : h * 0.063,
                                width: w * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFFFFFFF),
                                ),
                                child: Center(
                                  child: Text(
                                    (Responsive.isDesktop(context))
                                        ? "Select image"
                                        : "Image",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: h * 0.016),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: w * 0.01),
                                        height: h * 0.065,
                                        width: (Responsive.isDesktop(context))
                                            ? w * 0.22
                                            : w * 0.22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xffFFFFFF),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.01),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Enter Here",
                                              hintStyle: TextStyle(
                                                fontSize: 10,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: w * 0.02),
                                        height: h * 0.065,
                                        width: (Responsive.isDesktop(context))
                                            ? w * 0.22
                                            : w * 0.24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xffFFFFFF),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.01),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Enter Here",
                                              hintStyle: TextStyle(
                                                fontSize: 10,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: h * 0.01),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.01),
                                        child: Text(
                                          "Hosting Server",
                                          style: TextStyle(
                                            fontSize:
                                                (Responsive.isDesktop(context))
                                                    ? 13
                                                    : 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.185),
                                        child: Text(
                                          "Client License No.",
                                          style: TextStyle(
                                            fontSize:
                                                (Responsive.isDesktop(context))
                                                    ? 13
                                                    : 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: w * 0.01),
                                      height: h * 0.065,
                                      width: w * 0.22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffFFFFFF),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.01),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "Enter Here",
                                            hintStyle: TextStyle(
                                              fontSize: 10,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: w * 0.02),
                                      height: h * 0.065,
                                      width: w * 0.22,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffFFFFFF),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.01),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "Enter Here",
                                            hintStyle: TextStyle(
                                              fontSize: 10,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.01),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.01),
                                        child: Text(
                                          "Plan Id",
                                          style: TextStyle(
                                            fontSize:
                                                (Responsive.isDesktop(context))
                                                    ? 13
                                                    : 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.215),
                                        child: Text(
                                          "Plan Selected",
                                          style: TextStyle(
                                            fontSize:
                                                (Responsive.isDesktop(context))
                                                    ? 13
                                                    : 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.01),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: w * 0.01),
                                        height: h * 0.065,
                                        width: w * 0.22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xffFFFFFF),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.01),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Enter Here",
                                              hintStyle: TextStyle(
                                                fontSize: 10,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: w * 0.02),
                                        height: h * 0.065,
                                        width: w * 0.22,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xffFFFFFF),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.01),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "Enter Here",
                                              hintStyle: TextStyle(
                                                fontSize: 10,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Plan Price (User/Month)",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.139),
                              child: Text(
                                "Status",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.205),
                              child: Text(
                                "Website",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Contact No.",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.185),
                              child: Text(
                                "Time Zone",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.19),
                              child: Text(
                                "Business Hours",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText:
                                        "${selectedTime.hour}:${selectedTime.minute}",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          _selectTime(context);
                                        },
                                        icon: Icon(Icons.access_alarm)),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.001,
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xffC1C1C1),
                        ),
                        Text(
                          "Authorised User Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.34),
                              child: Text(
                                "Email Id",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.338),
                              child: Text(
                                "Mobile",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xffC1C1C1),
                        ),
                        SizedBox(
                          height: h * 0.001,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Text(
                          "Primary Address",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Street",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.22),
                              child: Text(
                                "City",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.21),
                              child: Text(
                                "State",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.03),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.21),
                              child: Text(
                                "Zip Code",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.06),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Shipping  Address",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            StatefulBuilder(builder: (BuildContext context,
                                StateSetter stateSetter) {
                              return Checkbox(
                                onChanged: (value) {
                                  stateSetter(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                value: isChecked,
                              );
                            }),
                            Text(
                              "(Same as above)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Street",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.225),
                              child: Text(
                                "City",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.2),
                              child: Text(
                                "State",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: h * 0.08),
                              child: Container(
                                height: h * 0.065,
                                width: w * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: w * 0.01),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Here",
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.215),
                              child: Text(
                                "Zip Code",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.065),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Billing Address",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            StatefulBuilder(builder: (BuildContext context,
                                StateSetter stateSetter) {
                              return Checkbox(
                                onChanged: (value) {
                                  stateSetter(() {
                                    isChecked2 = !isChecked2;
                                  });
                                },
                                value: isChecked2,
                              );
                            }),
                            Text(
                              "(Same as above)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Street",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.225),
                              child: Text(
                                "City",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.2),
                              child: Text(
                                "State",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.04),
                              child: Container(
                                height: h * 0.065,
                                width: w * 0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: w * 0.01),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Enter Here",
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.01),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize:
                                    (Responsive.isDesktop(context)) ? 13 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.215),
                              child: Text(
                                "Zip Code",
                                style: TextStyle(
                                  fontSize:
                                      (Responsive.isDesktop(context)) ? 13 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.005,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: w * 0.0),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: w * 0.065),
                              height: h * 0.065,
                              width: w * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: w * 0.01),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Here",
                                    hintStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                  "Submit",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 20
                                        : 16,
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
                                  "Close",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 20
                                        : 16,
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
                )
              : AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  backgroundColor: Color(0xffD9D9D9),
                  content: Container(
                    width: w,
                    height: h,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffFFFFFF),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w * 0.05),
                              child: Text(
                                "Add Client",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01, bottom: h * 0.005),
                          child: Text(
                            "Client Id",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 13 : 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.065,
                          width: w * 0.33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Client Name",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.005,
                              left: w * 0.01,
                              bottom: h * 0.005),
                          child: Text(
                            "Hosting Server",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.00),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              top: h * 0.005,
                              bottom: h * 0.005),
                          child: Text(
                            "Client License No.",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.00),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              top: h * 0.005,
                              bottom: h * 0.005),
                          child: Text(
                            "Plan Id",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Plan Selected",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Plan Price (User/Month)",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Status",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Website",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              top: h * 0.005,
                              bottom: h * 0.005),
                          child: Text(
                            "Contact No.",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.00),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Time Zone",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Business Hours",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText:
                                    "${selectedTime.hour}:${selectedTime.minute}",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    icon: Icon(Icons.access_alarm)),
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.001,
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xffC1C1C1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Authorised User Information",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Email Id",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Mobile",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.002,
                        ),
                        Divider(
                          thickness: 1,
                          color: Color(0xffC1C1C1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Primary Address",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Street",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "City",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "State",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              top: h * 0.005,
                              bottom: h * 0.005),
                          child: Text(
                            "Country",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Zip Code",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.002,
                        ),
                        Row(
                          children: [
                            Text(
                              "Shipping  Address",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            StatefulBuilder(builder: (BuildContext context,
                                StateSetter stateSetter) {
                              return Checkbox(
                                onChanged: (value) {
                                  stateSetter(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                value: isChecked,
                              );
                            }),
                            Text(
                              "(Same as above)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.002,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Street",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "City",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "State",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Country",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Zip Code",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.002,
                        ),
                        Row(
                          children: [
                            Text(
                              "Billing Address",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            StatefulBuilder(builder: (BuildContext context,
                                StateSetter stateSetter) {
                              return Checkbox(
                                onChanged: (value) {
                                  stateSetter(() {
                                    isChecked2 = !isChecked2;
                                  });
                                },
                                value: isChecked2,
                              );
                            }),
                            Text(
                              "(Same as above)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Street",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "City",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "State",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Country",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.01,
                              bottom: h * 0.005,
                              top: h * 0.005),
                          child: Text(
                            "Zip Code",
                            style: TextStyle(
                              fontSize:
                                  (Responsive.isDesktop(context)) ? 16 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: w * 0.0),
                          height: h * 0.065,
                          width: w * 0.18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: w * 0.01),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Here",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                ),
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
                                  "Submit",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 20
                                        : 16,
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
                                  "Close",
                                  style: TextStyle(
                                    fontSize: (Responsive.isDesktop(context))
                                        ? 20
                                        : 16,
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
