import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';
import 'Admine_Add_plan.dart';

class AdmineAddPlanResponsive extends StatefulWidget {
  const AdmineAddPlanResponsive({super.key});

  @override
  State<AdmineAddPlanResponsive> createState() =>
      _AdmineAddPlanResponsiveState();
}

class _AdmineAddPlanResponsiveState extends State<AdmineAddPlanResponsive> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: AdmineAddPlan(),
        tablet: AdmineAddPlan(),
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
              child: AdmineAddPlan(),
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
