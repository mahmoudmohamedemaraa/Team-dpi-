import 'package:depi_project/app_theme.dart';
import 'package:depi_project/features/auth/presentation/views/widgets/home_widget/home_layout.dart';
import 'package:depi_project/features/auth/presentation/views/widgets/notifications_body.dart';
import 'package:depi_project/features/auth/presentation/views/widgets/repports_body.dart';
import 'package:depi_project/features/auth/presentation/views/widgets/profile_body.dart';
import 'package:depi_project/features/auth/presentation/views/widgets/submit_report_body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List <Widget> screens =[
    HomeLayout(),
    RepportsBody(),
   // SubmitReportBody(),
    NotificationsBody(),
    ProfileBody(),
  ];
  int currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.transparent,
            padding: EdgeInsets.zero,
            elevation: 0,
            child: SizedBox(
              height: 60,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                selectedItemColor: AppTheme.primaryColor,
                unselectedItemColor: AppTheme.black,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "الرئيسية",
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long),
                    label: "بلاغاتي",
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: "الاشعارات",
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "الملف الشخصي",            
                    ),
                ],
                onTap: (value) => setState(() {
                  currentIndex= value;
                }),
                ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppTheme.primaryColor,
          focusColor: AppTheme.primaryColor,
          onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
             builder: (context) => SubmitReportBody(),
             ),
             child:Icon(Icons.add,
             size: 32,
             color: AppTheme.white,
             ) , 
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          extendBody: true,
       body: screens[currentIndex],

    );
  }
}