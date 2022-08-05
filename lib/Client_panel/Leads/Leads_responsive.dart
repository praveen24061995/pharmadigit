import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Client_panel/Leads/Leads.dart';

import '../../Responsive/Responsiv.dart';
import '../DrawerScreen/Drawer.dart';

class LeadsResponsive extends StatefulWidget {
  const LeadsResponsive({super.key});

  @override
  State<LeadsResponsive> createState() => _LeadsResponsiveState();
}

class _LeadsResponsiveState extends State<LeadsResponsive> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: LeadsScreen(),
        tablet: LeadsScreen(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child: DrawerScreen(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: LeadsScreen(),
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
