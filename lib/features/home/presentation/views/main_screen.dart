import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/features/add_report/presentation/views/add_report_view.dart';
import 'package:depi_project/features/home/presentation/views/home_layout.dart';
import 'package:depi_project/features/home/presentation/views/profile_body.dart';
import 'package:depi_project/core/widgets/notification_badge_icon.dart';
import 'package:depi_project/features/notifications/domain/repos/notifications_repo.dart';
import 'package:depi_project/core/cubits/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:depi_project/features/notifications/presentation/views/notifications_view.dart';
import 'package:depi_project/features/reports/presentation/views/repports_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  late final GetNotificationsCubit notificationsCubit;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    final repo = getIt.get<NotificationsRepo>();
    final userId = getUser().uId;
    notificationsCubit = GetNotificationsCubit(repo)
      ..getUserNotifications(userId);

    screens = [
      const HomeLayout(),
      const RepportsBody(),
      BlocProvider.value(
        value: notificationsCubit,
        child: const NotificationsView(provideCubit: false),
      ),
      const ProfileBody(),
    ];
  }

  @override
  void dispose() {
    notificationsCubit.close();
    super.dispose();
  }

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
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
            bloc: notificationsCubit,
            builder: (context, state) {
              final unreadCount = state is GetNotificationsSuccess
                  ? state.notifications.where((n) => !n.isRead).length
                  : 0;

              return BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                selectedItemColor: const Color(0xFFFF6B5E),
                unselectedItemColor: const Color.fromARGB(153, 86, 83, 83),
                iconSize: 24,
                onTap: (index) => setState(() => currentIndex = index),
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "الرئيسية",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long),
                    label: "بلاغاتي",
                  ),
                  BottomNavigationBarItem(
                    icon: NotificationBadgeIcon(count: unreadCount),
                    label: "الاشعارات",
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "الملف الشخصي",
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
