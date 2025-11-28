import 'package:animate_do/animate_do.dart';
import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class SecurityTipsPage extends StatelessWidget {
  SecurityTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tips = [
      {
        "icon": Icons.lock,
        "color": Colors.blueAccent,
        "text": S.of(context).tip1,
      },
      {
        "icon": Icons.link_off,
        "color": const Color.fromARGB(255, 212, 34, 34),
        "text": S.of(context).tip2,
      },
      {"icon": Icons.https, "color": Colors.green, "text": S.of(context).tip3},
      {
        "icon": Icons.security,
        "color": Colors.orangeAccent,
        "text": S.of(context).tip4,
      },
      {
        "icon": Icons.vpn_lock,
        "color": Colors.teal,
        "text": S.of(context).tip5,
      },
      {
        "icon": Icons.password,
        "color": Colors.purple,
        "text": S.of(context).tip6,
      },
      {
        "icon": Icons.backup,
        "color": Colors.indigo,
        "text": S.of(context).tip7,
      },
      {
        "icon": Icons.warning,
        "color": const Color.fromARGB(255, 226, 69, 22),
        "text": S.of(context).tip8,
      },
      {
        "icon": Icons.wifi_off,
        "color": const Color.fromARGB(255, 81, 56, 47),
        "text": S.of(context).tip9,
      },
      {"icon": Icons.update, "color": Colors.cyan, "text": S.of(context).tip10},
    ];

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: buildAppBar(title: S.of(context).securityTips),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return FadeInUp(
            delay: Duration(milliseconds: 100 * index),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: tip["color"].withOpacity(0.15),
                  child: Icon(tip["icon"], color: tip["color"]),
                ),
                title: Text(
                  tip["text"],
                  style: const TextStyle(
                    color: AppTheme.black,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
