import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharmadigit/Admine_panel/Admine_Manage_Client/Admine_Manage_Client.dart';

import '../../Responsive/Responsiv.dart';
import '../Admine_Drawer/Admine_Drawer.dart';

class AdmineManageClientRessponsiv extends StatefulWidget {
  const AdmineManageClientRessponsiv({super.key});

  @override
  State<AdmineManageClientRessponsiv> createState() =>
      _AdmineManageClientRessponsivState();
}

class _AdmineManageClientRessponsivState
    extends State<AdmineManageClientRessponsiv> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: AdmineManageClient(),
        tablet: AdmineManageClient(),
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
              child: AdmineManageClient(),
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
