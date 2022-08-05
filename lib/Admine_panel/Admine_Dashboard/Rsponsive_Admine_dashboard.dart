import 'package:flutter/material.dart';
import 'package:pharmadigit/Admine_panel/Admine_Dashboard/Admine_Dashboaed.dart';
import 'package:pharmadigit/Client_panel/DrawerScreen/Drawer.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';

class AdmineDeshboardResponsive extends StatefulWidget {
  const AdmineDeshboardResponsive({super.key});

  @override
  State<AdmineDeshboardResponsive> createState() =>
      _AdmineDeshboardResponsive();
}

class _AdmineDeshboardResponsive extends State<AdmineDeshboardResponsive> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: AdmineDashboard(),
        tablet: AdmineDashboard(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child: AdmineDrawer(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: AdmineDashboard(),
            ),
            // Expanded(
            //   flex: _size.width > 1340 ? 8 : 10,
            //   child: EmailScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}
