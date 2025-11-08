import 'package:depi_project/features/add_report/presentation/views/add_report_view.dart';
import 'package:depi_project/features/home/presentation/views/home_layout.dart';
import 'package:depi_project/features/home/presentation/views/notifications_body.dart';
import 'package:depi_project/features/home/presentation/views/profile_body.dart';
import 'package:depi_project/features/reports/presentation/views/repports_body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeLayout(),
    const RepportsBody(),
    const NotificationsBody(),
    const ProfileBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,

      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // خلفية غامقة أنيقة
        body: IndexedStack(index: currentIndex, children: screens),

        // 🔸 الزر العائم في المنتصف (أحمر متوهج)
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFF6B5E), // توهج أحمر
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: FloatingActionButton(
            backgroundColor: const Color(0xFFFF6B5E),
            elevation: 6,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const AddReportView(),
              );
            },
            child: const Icon(Icons.add, size: 32, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // 🔸 الشريط السفلي
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              //   backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedItemColor: const Color(0xFFFF6B5E),
              unselectedItemColor: const Color.fromARGB(153, 86, 83, 83),
              iconSize: 24,
              onTap: (index) => setState(() => currentIndex = index),
              items: const [
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
            ),
          ),
        ),
      ),
    );
  }
}
