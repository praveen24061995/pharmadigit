import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmadigit/Admine_panel/Admine_Dashboard/Admine_Dashboaed.dart';
import 'package:pharmadigit/Admine_panel/Admine_Dashboard/Rsponsive_Admine_dashboard.dart';
import 'package:pharmadigit/Admine_panel/Admine_ForgotPass/Admine_Forgotpass.dart';
import 'package:pharmadigit/Admine_panel/Admine_ForgotPass/bloc/Admine_Forgot_Pass_bloc.dart';
import 'package:pharmadigit/Admine_panel/Admine_Login/Admine_Login.dart';
import 'package:pharmadigit/Admine_panel/Admine_Login/bloc/Admine_Login_bloc.dart';
import 'package:pharmadigit/Admine_panel/Admine_Resset_Pass/Admine_ResetPassword.dart';
import 'package:pharmadigit/Admine_panel/Admine_Resset_Pass/bloc/Admine_RessetPassword_bloc.dart';
import 'package:pharmadigit/Admine_panel/Admine_varification/Admine_Varification.dart';
import 'package:pharmadigit/Client_panel/ForgotPasswordScreen/Forgotpassword.dart';
import 'package:pharmadigit/Client_panel/ForgotPasswordScreen/bloc/ForgotPass_bloc.dart';

import 'package:pharmadigit/Client_panel/Leads/Leads_responsive.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/Login.dart';
import 'package:pharmadigit/Client_panel/LoginScreen/bloc/Login_bloc.dart';
import 'package:pharmadigit/Client_panel/Reset_PasswordScreen/Reset_Pass.dart';
import 'package:pharmadigit/Client_panel/Reset_PasswordScreen/bloc/Reset_pass_bloc.dart';
import 'package:pharmadigit/Client_panel/VarifyScreen/Varification.dart';
import 'package:pharmadigit/Splash.dart';

import 'Admine_panel/Admine_Manage_Client/Admine_Manage_ClientRessponsive.dart';
import 'Admine_panel/Admine_Plan_Management/Admine_Plan_Management.dart';
import 'Admine_panel/Admine_Plan_Management/Admine_Responsiv_Management.dart';
import 'Admine_panel/Admine_Setting/Admine_Responsiv_Setting.dart';
import 'Admine_panel/Admine_Subscription_Plan/Admine_AddPlan_Responsive.dart';
import 'Admine_panel/Admine_Subscription_Plan/Admine_ListPlanResponsive.dart';
import 'Admine_panel/Admine_Subscription_Plan/Admine_ModifyPlanResponshive.dart';
import 'Client_panel/Client_Dashboard/ClientDashboardResponse.dart';

void main() async {
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('vt', 'US'),
      ],
      path:
          'assets/translation', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashScreen(),
      routes: {
        '/Adminelogin': (context) => BlocProvider(
              create: (context) => AdmineLoginBloc(),
              child: AdmineLoginScreen(),
            ),
        '/AdmineForgotPass': (context) => BlocProvider(
              create: (context) => AdmineForgotPasswordBloc(),
              child: AdmineForgotPass(),
            ),
        '/Adminevarification': (context) => AdminVarification(),
        '/Adminerepassword': (context) => BlocProvider(
              create: (context) => AdmineRessetPasswordBloc(),
              child: AdmineRessetPass(),
            ),
        // '/signup': (context) => SignUpPage(),

        '/AdmineDashboard': (context) => AdmineDeshboardResponsive(),
        '/AdminePlanManagement': (context) => AdmineResponsivManagement(),
        '/AdmineSetting': (context) => AdmineSettingResponsive(),
        '/AdmineSubscriptionPlan': (context) => AdmineAddPlanResponsive(),
        '/AdmineSubscriptionModifyPlan': (context) => AdmineModifyResponshive(),
        '/AdmineSubscriptionListPlan': (context) => AdmineListPlanResspons(),
        '/AdmineManageClientResponsive': (context) =>
            AdmineManageClientRessponsiv(),

        '/Clientlogin': (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: LoginScreen(),
            ),

        '/ClientDashboard': (context) => HomeResponsive(),
        '/forgotpass': (context) => BlocProvider(
              create: (context) => ForgotPasswordBloc(),
              child: ForgotPassword(),
            ),
        // '/Dashboard': (context) => HomePage(),
        '/LeadsResponsive': (context) => LeadsResponsive(),
        // '/Opportunity': (context) => EventScreen(),
        // '/Contact': (context) => NotificationScreen(),
        '/resetpassword': (context) => BlocProvider(
              create: (context) => RessetPasswordBloc(),
              child: ResetPassword(),
            ),
        '/varification': (context) => Varification()
      },
      initialRoute: '/',
    );
  }
}
