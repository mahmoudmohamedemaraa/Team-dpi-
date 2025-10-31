import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class WidgetEmergencyNumbers extends StatelessWidget {
  const WidgetEmergencyNumbers({
    super.key,
    required this.icon,
    required this.text1,
    required this.number,
    });
  final IconData icon;
  final String text1;
  final String number;

  _callNumber() async{
  bool? res = await FlutterPhoneDirectCaller.callNumber(number.toString());
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callNumber,
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.lightRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.bold
                          ), 
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      number,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold
                          ), 
                    ),
            
                  ],
                ),
                Icon(icon, color: AppTheme.primaryColor, size: 40),
      
              ],
            ),
          )
        ),
    );
  }
  
}