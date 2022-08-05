import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Admine_panel/Admine_User/Admine_User.dart';
import 'package:pharmadigit/Client_panel/DrawerScreen/Drawer.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Opportunity/Admine_Opportunity.dart';
import '../Admine_Other/Admine_Other.dart';
import '../Admine_Sales/Admine_Sales.dart';
import '../Admine_Setting/Admine_Responsiv_Setting.dart';
import '../Admine_panel_lead/Admine_panel_lead.dart';

class AdmineDashboard extends StatefulWidget {
  const AdmineDashboard({super.key});

  @override
  State<AdmineDashboard> createState() => _AdmineDashboardState();
}

class _AdmineDashboardState extends State<AdmineDashboard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;
  bool colorshow = false;
  var w;
  var h;
  bool setting = false;

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
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
