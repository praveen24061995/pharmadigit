import 'package:flutter/material.dart';
import 'package:pharmadigit/Client_panel/DrawerScreen/Drawer.dart';
import 'package:pharmadigit/Responsive/Responsiv.dart';
import '../Client_Setting/Client_Setting_Ress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool setting = false;
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        drawer: DrawerScreen(),
        key: _scaffoldKey,
        body: Column(
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
                                              ClientSettingRess(),
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
                                            ClientSettingRess(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.settings,
                                  color:
                                      setting ? Color(0xff80B5AE) : Colors.grey,
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
    );
  }
}
