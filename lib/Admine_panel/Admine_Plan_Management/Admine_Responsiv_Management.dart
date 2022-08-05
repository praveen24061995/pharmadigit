import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Admine_panel/Admine_Plan_Management/Admine_Plan_Management.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';

class AdmineResponsivManagement extends StatefulWidget {
  const AdmineResponsivManagement({super.key});

  @override
  State<AdmineResponsivManagement> createState() =>
      _AdmineResponsivManagementState();
}

class _AdmineResponsivManagementState extends State<AdmineResponsivManagement> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: AdminePlanManagement(),
        tablet: AdminePlanManagement(),
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
              child: AdminePlanManagement(),
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
