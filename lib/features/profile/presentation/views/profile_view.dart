import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/helpers/error_message_helper.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/features/auth/domain/entities/user_entity.dart';
import 'package:depi_project/features/auth/domain/repos/auth_repo.dart';
import 'package:depi_project/features/auth/presentation/views/signin_view.dart';
import 'package:depi_project/features/profile/presentation/widgets/language_switcher.dart';
import 'package:depi_project/features/profile/presentation/widgets/profile_info_tile.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getUser();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: S.of(context).profile),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45.r,
                backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  size: 50.sp,
                  color: AppTheme.primaryColor,
                ),
              ),

              SizedBox(height: 15.h),

              Text(
                "${user.firstName} ${user.lastName}",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 30.h),

              ProfileInfoTile(
                title: S.of(context).email,
                value: user.email,
                icon: Icons.email_outlined,
              ),
              ProfileInfoTile(
                title: S.of(context).phoneNumber,
                value: user.phoneNumber,
                icon: Icons.phone,
              ),
              ProfileInfoTile(
                title: S.of(context).nationalID,
                value: user.nationalId,
                icon: Icons.credit_card,
              ),

              SizedBox(height: 30.h),
              const LanguageSwitcher(),

              SizedBox(height: 30.h),
              CustomButton(
                onPressed: () async {
                  final authRepo = getIt.get<AuthRepo>();
                  final result = await authRepo.signOut();

                  result.fold(
                    (failure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getErrorMessage(context, failure.message),
                          ),
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
                text: S.of(context).logout,
                gradientColors: [
                  Colors.red.shade400,
                  Colors.red.shade600,
                  Colors.red.shade400,
                ],
                //shadowColor: Colors.red.shade300,
                textColor: Colors.white,
              ),
              SizedBox(
                height:
                    (MediaQuery.of(context).padding.bottom +
                            kBottomNavigationBarHeight +
                            20)
                        .h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
