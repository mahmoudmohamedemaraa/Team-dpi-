import 'package:depi_project/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class WidgetEmergencyNumbers extends StatefulWidget {
  const WidgetEmergencyNumbers({
    super.key,
    required this.icon,
    required this.text1,
    required this.number,
  });
  final IconData icon;
  final String text1;
  final String number;

  @override
  State<WidgetEmergencyNumbers> createState() => _WidgetEmergencyNumbersState();
}

class _WidgetEmergencyNumbersState extends State<WidgetEmergencyNumbers> {
  bool _showCallConfirm = false;

  _callNumber() async{
    await FlutterPhoneDirectCaller.callNumber(widget.number);       
    setState(() {
      _showCallConfirm = false;
    });
  }

  @override
  Widget build(BuildContext context) {           
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
        InkWell(
          onTap: (){      
            setState(() {
              _showCallConfirm = !_showCallConfirm;
            });
          },
          borderRadius: BorderRadius.circular(10),       
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
                        widget.text1,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold
                            ), 
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.number,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold
                            ), 
                      ),
                    ],
                  ),
                  Icon(widget.icon, color: AppTheme.primaryColor, size: 40),
                ],
              ),
            ),
          ),
        ),
        
        if (_showCallConfirm)
          Padding(
            padding: const EdgeInsets.only(top: 8),      
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.15), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'هل تريد الاتصال الآن بـ ${widget.number}؟',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppTheme.black,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  
                  InkWell(
                    onTap: _callNumber, 
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor, 
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.phone, color: AppTheme.white, size: 18),
                          SizedBox(width: 4),
                          Text(
                            'اتصل الآن',
                            style: TextStyle(color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}