import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Admine_panel/Admine_Subscription_Plan/Admine_ModifyPlan.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import 'Admine_ListPlan.dart';

class AdmineListPlanResspons extends StatefulWidget {
  const AdmineListPlanResspons({super.key});

  @override
  State<AdmineListPlanResspons> createState() => _AdmineListPlanRessponsState();
}

class _AdmineListPlanRessponsState extends State<AdmineListPlanResspons> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: AdmineListPlan(),
        tablet: AdmineListPlan(),
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
              child: AdmineListPlan(),
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
