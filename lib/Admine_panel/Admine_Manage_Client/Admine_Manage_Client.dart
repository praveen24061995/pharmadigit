import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';
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

  late List<DatatableHeader> _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;
  String? _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  // ignore: unused_field
  String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;
  var random = new Random();

  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;
    print(i);
    // ignore: unused_local_variable
    for (var data in source) {
      temps.add({
        "id": i,
        "sku": "$i\000$i",
        "name": "Product $i",
        "category": "Category-$i",
        "price": i * 10.00,
        "cost": "20.00",
        "margin": "${i}0.20",
        "in_stock": "${i}0",
        "alert": "5",
        "received": [i + 20, 150]
      });
      i++;
    }
    return temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start: 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    /// set headers
    _headers = [
      DatatableHeader(
        text: "Name of Client",
        value: "id",
        show: true,
        sortable: true,
        // textAlign: TextAlign.center
      ),
      DatatableHeader(
        text: "Plan ID",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        editable: true,
        // textAlign: TextAlign.left
      ),
      DatatableHeader(
        text: "Plan",
        value: "sku",
        show: true,
        sortable: true,
        // textAlign: TextAlign.center
      ),
      DatatableHeader(
        text: "Status",
        value: "category",
        show: true,
        sortable: true,
        // textAlign: TextAlign.left
      ),
      DatatableHeader(
        text: "Hosting Server",
        value: "price",
        show: true,
        sortable: true,
        // textAlign: TextAlign.left
      ),
      //   DatatableHeader(
      //       text: "Margin",
      //       value: "margin",
      //       show: true,
      //       sortable: true,
      //       textAlign: TextAlign.left),
      //   DatatableHeader(
      //       text: "In Stock",
      //       value: "in_stock",
      //       show: true,
      //       sortable: true,
      //       textAlign: TextAlign.left),
      //   DatatableHeader(
      //       text: "Alert",
      //       value: "alert",
      //       show: true,
      //       sortable: true,
      //       textAlign: TextAlign.left),
      //   DatatableHeader(
      //       text: "Received",
      //       value: "received",
      //       show: true,
      //       sortable: false,
      //       sourceBuilder: (value, row) {
      //         List list = List.from(value);
      //         return Container(
      //           child: Column(
      //             children: [
      //               Container(
      //                 width: 85,
      //                 child: LinearProgressIndicator(
      //                   value: list.first / list.last,
      //                 ),
      //               ),
      //               Text("${list.first} of ${list.last}")
      //             ],
      //           ),
      //         );
      //       },
      //       textAlign: TextAlign.center),
      //
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
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
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: (Responsive.isDesktop(context))
                                      ? w * 0.0
                                      : w * 0.025),
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
                  // child: DataTable2(
                  //     // columnSpacing: 12,
                  //     // horizontalMargin: 12,
                  //     // minWidth: 600,
                  //     columns: [
                  //       DataColumn2(
                  //         label: Text(
                  //           'Name of Client',
                  //           style: TextStyle(
                  //               fontSize:
                  //                   (Responsive.isDesktop(context)) ? 15 : 12,
                  //               fontWeight: FontWeight.w600,
                  //               color: Colors.black),
                  //         ),
                  //         size: ColumnSize.L,
                  //       ),
                  //       DataColumn(
                  //         label: Text(
                  //           'Plan ID',
                  //           style: TextStyle(
                  //               fontSize:
                  //                   (Responsive.isDesktop(context)) ? 15 : 12,
                  //               fontWeight: FontWeight.w600,
                  //               color: Colors.black),
                  //         ),
                  //       ),
                  //       DataColumn(
                  //         label: Text(
                  //           'Plan',
                  //           style: TextStyle(
                  //               fontSize:
                  //                   (Responsive.isDesktop(context)) ? 15 : 12,
                  //               fontWeight: FontWeight.w600,
                  //               color: Colors.black),
                  //         ),
                  //       ),
                  //       DataColumn(
                  //         label: Text(
                  //           'Status',
                  //           style: TextStyle(
                  //               fontSize:
                  //                   (Responsive.isDesktop(context)) ? 15 : 12,
                  //               fontWeight: FontWeight.w600,
                  //               color: Colors.black),
                  //         ),
                  //       ),
                  //       DataColumn(
                  //         label: Padding(
                  //           padding: EdgeInsets.only(left: w * 0.05),
                  //           child: Text(
                  //             'Hosting Server',
                  //             style: TextStyle(
                  //                 fontSize:
                  //                     (Responsive.isDesktop(context)) ? 15 : 12,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Colors.black),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //     rows: List<DataRow>.generate(
                  //         1,
                  //         (index) => DataRow(cells: [
                  //               DataCell(Padding(
                  //                 padding: EdgeInsets.only(left: w * 0.015),
                  //                 child: Text('Ems'),
                  //               )),
                  //               DataCell(Text('123486')),
                  //               DataCell(Text('Gold')),
                  //               DataCell(Text('Active')),
                  //               DataCell(Padding(
                  //                 padding: EdgeInsets.only(left: w * 0.052),
                  //                 child: Row(
                  //                   children: [
                  //                     Text(
                  //                       "Shared Server",
                  //                     ),
                  //                   ],
                  //                 ),
                  //               )),
                  //
                  //Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 700,
                  ),
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.black,
                    clipBehavior: Clip.none,
                    child: ResponsiveDatatable(
                      // title: TextButton.icon(
                      //   onPressed: () => {},
                      //   icon: Icon(Icons.add),
                      //   label: Text("new item"),
                      // ),
                      reponseScreenSizes: [ScreenSize.xs],
                      actions: [
                        // if (_isSearch)
                        // Expanded(
                        //     child: TextField(
                        //   decoration: InputDecoration(
                        //       hintText: 'Enter search term based on ' +
                        //           _searchKey!
                        //               .replaceAll(new RegExp('[\\W_]+'), ' ')
                        //               .toUpperCase(),
                        //       prefixIcon: IconButton(
                        //           icon: Icon(Icons.cancel),
                        //           onPressed: () {
                        //             setState(() {
                        //               _isSearch = false;
                        //             });
                        //             _initializeData();
                        //           }),
                        //       suffixIcon: IconButton(
                        //           icon: Icon(Icons.search),
                        //           onPressed: () {})),
                        //   onSubmitted: (value) {
                        //     _filterData(value);
                        //   },
                        // )),
                        // if (!_isSearch)
                        // IconButton(
                        //     icon: Icon(Icons.search),
                        //     onPressed: () {
                        //       setState(() {
                        //         _isSearch = true;
                        //       });
                        //     })
                      ],
                      headers: _headers,
                      source: _source,
                      selecteds: _selecteds,
                      showSelect: _showSelect,
                      autoHeight: false,
                      dropContainer: (data) {
                        if (int.tryParse(data['id'].toString())!.isEven) {
                          return Text("is Even");
                        }
                        return Container();
                      },
                      onChangedRow: (value, header) {
                        /// print(value);
                        /// print(header);
                      },
                      onSubmittedRow: (value, header) {
                        /// print(value);
                        /// print(header);
                      },
                      onTabRow: (data) {
                        print(data);
                      },
                      onSort: (value) {
                        setState(() => _isLoading = true);

                        setState(() {
                          _sortColumn = value;
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            _sourceFiltered.sort((a, b) =>
                                b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                          } else {
                            _sourceFiltered.sort((a, b) =>
                                a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                          }
                          // var _rangeTop =
                          //     _currentPerPage! < _sourceFiltered.length
                          //         ? _currentPerPage!
                          //         : _sourceFiltered.length;
                          // _source =
                          //     _sourceFiltered.getRange(0, _rangeTop).toList();
                          // _searchKey = value;

                          // _isLoading = false;
                        });
                      },
                      expanded: _expanded,
                      sortAscending: _sortAscending,
                      sortColumn: _sortColumn,
                      isLoading: _isLoading,
                      onSelect: (value, item) {
                        print("$value  $item ");
                        // if (value!) {
                        //   setState(() => _selecteds.add(item));
                        // } else {
                        //   setState(() =>
                        //       _selecteds.removeAt(_selecteds.indexOf(item)));
                        // }
                      },
                      // onSelectAll: (value) {
                      //   if (value!) {
                      //     setState(() => _selecteds =
                      //         _source.map((entry) => entry).toList().cast());
                      //   } else {
                      //     setState(() => _selecteds.clear());
                      //   }
                      // },
                      footers: [
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 15),
                        //   child: Text("Rows per page:"),
                        // ),
                        // if (_perPages.isNotEmpty)
                        //   Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 15),
                        //     child: DropdownButton<int>(
                        //       value: _currentPerPage,
                        //       items: _perPages
                        //           .map((e) => DropdownMenuItem<int>(
                        //                 child: Text("$e"),
                        //                 value: e,
                        //               ))
                        //           .toList(),
                        //       onChanged: (dynamic value) {
                        //         setState(() {
                        //           _currentPerPage = value;
                        //           _currentPage = 1;
                        //           _resetData();
                        //         });
                        //       },
                        //       isExpanded: false,
                        //     ),
                        //   ),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 15),
                        //   child: Text(
                        //       "$_currentPage - $_currentPerPage of $_total"),
                        // ),
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.arrow_back_ios,
                        //     size: 16,
                        //   ),
                        //   onPressed: _currentPage == 1
                        //       ? null
                        //       : () {
                        //           var _nextSet =
                        //               _currentPage - _currentPerPage!;
                        //           setState(() {
                        //             _currentPage = _nextSet > 1 ? _nextSet : 1;
                        //             _resetData(start: _currentPage - 1);
                        //           });
                        //         },
                        //   padding: EdgeInsets.symmetric(horizontal: 15),
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.arrow_forward_ios, size: 16),
                        //   onPressed:
                        //       _currentPage + _currentPerPage! - 1 > _total
                        //           ? null
                        //           : () {
                        //               var _nextSet =
                        //                   _currentPage + _currentPerPage!;

                        //               setState(() {
                        //                 _currentPage = _nextSet < _total
                        //                     ? _nextSet
                        //                     : _total - _currentPerPage!;
                        //                 _resetData(start: _nextSet - 1);
                        //               });
                        //             },
                        //   padding: EdgeInsets.symmetric(horizontal: 15),
                        // )
                      ],
                    ),
                  ),
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
                              padding: EdgeInsets.only(left: w * 0.17),
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
                              padding: EdgeInsets.only(left: w * 0.25),
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
                              padding: EdgeInsets.only(left: w * 0.221),
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
                              padding: EdgeInsets.only(left: w * 0.23),
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
                              padding: EdgeInsets.only(left: w * 0.425),
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
                              padding: EdgeInsets.only(left: w * 0.422),
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
                              padding: EdgeInsets.only(left: w * 0.26),
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
                              padding: EdgeInsets.only(left: w * 0.245),
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
                              padding: EdgeInsets.only(left: w * 0.25),
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
                              margin: EdgeInsets.only(left: w * 0.102),
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
                              padding: EdgeInsets.only(left: w * 0.265),
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
                              padding: EdgeInsets.only(left: w * 0.24),
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
                              padding: EdgeInsets.only(left: w * 0.256),
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
                              margin: EdgeInsets.only(left: w * 0.11),
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
                              padding: EdgeInsets.only(left: w * 0.265),
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
                              padding: EdgeInsets.only(left: w * 0.24),
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
                              padding: EdgeInsets.only(left: w * 0.255),
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
                              margin: EdgeInsets.only(left: w * 0.107),
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
