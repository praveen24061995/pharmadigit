import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Responsive/Responsiv.dart';
import '../DrawerScreen/Drawer.dart';
import 'Client_Setting.dart';

class ClientSettingRess extends StatefulWidget {
  const ClientSettingRess({super.key});

  @override
  State<ClientSettingRess> createState() => _ClientSettingRessState();
}

class _ClientSettingRessState extends State<ClientSettingRess> {
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ClientSetting(),
        tablet: ClientSetting(),
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
              child: ClientSetting(),
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
