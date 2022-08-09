import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import '../Admine_Opportunity/Admine_Opportunity.dart';
import '../Admine_Other/Admine_Other.dart';
import '../Admine_Sales/Admine_Sales.dart';
import '../Admine_User/Admine_User.dart';
import '../Admine_panel_lead/Admine_panel_lead.dart';

class AdmineSetting extends StatefulWidget {
  const AdmineSetting({super.key});

  @override
  State<AdmineSetting> createState() => _AdmineSettingState();
}

class _AdmineSettingState extends State<AdmineSetting>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;
  bool colorshow = false;
  var w;
  var h;
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
    // getbuyticket();
  }

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
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.settings,
                                      color: Color(0xff80B5AE),
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
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.settings,
                                    color: Color(0xff80B5AE),
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
              SizedBox(
                height: (Responsive.isDesktop(context)) ? h * 0.007 : h * 0.00,
              ),
              (Responsive.isDesktop(context))
                  ? Padding(
                      padding: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
                      child: TabBar(
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff68CBBE)),

                        tabs: const [
                          Tab(
                            text: "Lead",
                          ),
                          Tab(
                            text: "Opportunity",
                          ),
                          Tab(
                            text: "Sales",
                          ),
                          Tab(
                            text: "User",
                          ),
                          // Tab(
                          //   text: "Other Configaration",
                          // ),
                        ],
                        indicatorColor: Colors.black,
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        controller: _tabController,
                        // indicatorSize: TabBarIndicatorSize.tab,
                      ),
                    )
                  : TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff68CBBE)),

                      tabs: const [
                        Tab(
                          text: "Lead",
                        ),
                        Tab(
                          text: "Opportunity",
                        ),
                        Tab(
                          text: "Sales",
                        ),
                        Tab(
                          text: "User",
                        ),
                        // Tab(
                        //   text: "Other",
                        // ),
                      ],
                      indicatorColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: _tabController,
                      // indicatorSize: TabBarIndicatorSize.tab,
                    ),
              Container(
                height: MediaQuery.of(context).size.height * 0.69,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: [
                    AdmineLead(),
                    AdmineOpportunity(),
                    AdmineSales(),
                    AdmineUser(),
                    // AdmineOther(),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
