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
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

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
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
