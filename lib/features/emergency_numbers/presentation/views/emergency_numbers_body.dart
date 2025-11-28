import 'package:depi_project/app_theme.dart';
import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:depi_project/features/emergency_numbers/presentation/views/widgets/widget_emergency_numbers.dart';
import 'package:depi_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmergencyNumbersBody extends StatelessWidget {
  const EmergencyNumbersBody({super.key});
  static const String routeName = 'emergency_numbers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: buildAppBar(title: S.of(context).emergencyNumbers),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).usingEmergencyNumbers,
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: AppTheme.black),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.info, color: AppTheme.primaryColor),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),
            WidgetEmergencyNumbers(
              icon: Icons.local_hospital,
              text1: S.of(context).ambulance,
              number: "123",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.local_police,
              text1: S.of(context).police,
              number: "122",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.fire_extinguisher,
              text1: S.of(context).fireFighters,
              number: "180",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.support_agent,
              text1: S.of(context).HelpLine,
              number: "15044",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.electrical_services,
              text1: S.of(context).electricalEmergency,
              number: "121",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.local_fire_department,
              text1: S.of(context).fireEmergency,
              number: "180",
            ),
            SizedBox(height: 16),
            WidgetEmergencyNumbers(
              icon: Icons.water_drop,
              text1: S.of(context).water,
              number: "125",
            ),
          ],
        ),
      ),
    );
  }
}
