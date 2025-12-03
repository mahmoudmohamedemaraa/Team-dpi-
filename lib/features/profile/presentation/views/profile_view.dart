import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/core/helpers/error_message_helper.dart';
import 'package:depi_project/core/helpers/get_user.dart';
import 'package:depi_project/core/services/get_it_service.dart';
import 'package:depi_project/core/widgets/custom_button.dart';
import 'package:depi_project/features/auth/domain/entities/user_entity.dart';
import 'package:depi_project/features/auth/domain/repos/auth_repo.dart';
import 'package:depi_project/features/auth/presentation/views/signin_view.dart';
import 'package:depi_project/features/profile/presentation/widgets/profile_info_tile.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: AppTheme.primaryColor,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "${user.firstName} ${user.lastName}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

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

              const SizedBox(height: 30),
              _buildLanguageSwitcher(context),

              const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSwitcher(BuildContext context) {
    // Get current locale from MaterialApp
    final currentLocale = Localizations.localeOf(context);
    final isArabic = currentLocale.languageCode == 'ar';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.language, color: AppTheme.primaryColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              S.of(context).language,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _changeLanguage(context, 'ar'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isArabic
                        ? AppTheme.primaryColor
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'ع',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isArabic ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _changeLanguage(context, 'en'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: !isArabic
                        ? AppTheme.primaryColor
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'EN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: !isArabic ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    context.read<LocaleCubit>().changeLocale(languageCode);
  }
}
