import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
              child: Icon(Icons.person, size: 50, color: AppTheme.primaryColor),
            ),

            const SizedBox(height: 15),

            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            profileItem("البريد الإلكتروني", user.email, Icons.email_outlined),
            profileItem("رقم الهاتف", user.phoneNumber, Icons.phone),
            profileItem("الرقم القومي", user.nationalId, Icons.credit_card),
          ],
        ),
      ),
    );
  }

  Widget profileItem(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(223, 175, 170, 170),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
