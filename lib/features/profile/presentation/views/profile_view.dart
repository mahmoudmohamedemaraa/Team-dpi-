import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/features/auth/domain/entities/user_entity.dart';
import 'package:depi_project/features/auth/domain/repos/auth_repo.dart';
import 'package:depi_project/features/auth/presentation/views/signin_view.dart';
import 'package:depi_project/features/profile/presentation/widgets/profile_info_tile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'الملف الشخصي'),
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

            ProfileInfoTile(
              title: "البريد الإلكتروني",
              value: user.email,
              icon: Icons.email_outlined,
            ),
            ProfileInfoTile(
              title: "رقم الهاتف",
              value: user.phoneNumber,
              icon: Icons.phone,
            ),
            ProfileInfoTile(
              title: "الرقم القومي",
              value: user.nationalId,
              icon: Icons.credit_card,
            ),

            const SizedBox(height: 80),
            CustomButton(
              onPressed: () async {
                final authRepo = getIt.get<AuthRepo>();
                final result = await authRepo.signOut();

                result.fold(
                  (failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(failure.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  (_) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SigninView(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              text: 'تسجيل الخروج',
              gradientColors: [
                Colors.red.shade400,
                Colors.red.shade600,
                Colors.red.shade400,
              ],
              shadowColor: Colors.red.shade300,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
