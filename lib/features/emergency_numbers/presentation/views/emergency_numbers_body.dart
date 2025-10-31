import 'package:depi_project/app_theme.dart';
import 'package:depi_project/features/emergency_numbers/presentation/views/widgets/widget_emergency_numbers.dart';
import 'package:flutter/material.dart';

class EmergencyNumbersBody extends StatelessWidget {
  const EmergencyNumbersBody({super.key});
  static const String routeName = 'emergency_numbers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        title: const Text('ارقام الطوارئ',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )
        ),
        backgroundColor: AppTheme.white,
        elevation: 0,
        centerTitle: true,
      ),
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
                              "يرجى استخدام هذه الأرقام فقط في حالات الطوارئ الفعلية.",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: AppTheme.black
                                ), 
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
                    text1: "اسعاف",
                    number: "123",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.local_police,
                    text1: "شرطة",
                    number: "122",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.fire_extinguisher,
                    text1: "اطفاء حريق",
                    number: "180",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.support_agent,
                    text1: "خط نجدة",
                    number: "15044",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.electrical_services,
                    text1: "الطوارئ الكهربائية",
                    number: "121",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.local_fire_department,
                    text1: "الطوارئ الحريق",
                    number: "180",
                  ),
                  SizedBox(height: 16),
                  WidgetEmergencyNumbers(
                    icon: Icons.water_drop,
                    text1: " المياه",
                    number: "125",
                  ),                

          ],
        ),
      ),
      
    );
  }
}