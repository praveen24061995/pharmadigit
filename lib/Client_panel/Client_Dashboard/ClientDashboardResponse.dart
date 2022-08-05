import 'package:flutter/material.dart';

import 'package:pharmadigit/Client_panel/Client_Dashboard/ClientDashboard.dart';

import 'package:pharmadigit/Responsive/Responsiv.dart';

import '../DrawerScreen/Drawer.dart';

class HomeResponsive extends StatefulWidget {
  const HomeResponsive({super.key});

  @override
  State<HomeResponsive> createState() => _HomeResponsiveState();
}

class _HomeResponsiveState extends State<HomeResponsive> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: HomeScreen(),
        tablet: HomeScreen(),
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
              child: HomeScreen(),
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
