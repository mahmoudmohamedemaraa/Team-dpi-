import 'package:depi_project/core/helpers/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SecurityTipsPage extends StatelessWidget {
  final List<Map<String, dynamic>> tips = [
    {
      "icon": Icons.lock,
      "color": Colors.blueAccent,
      "text": "فعّل المصادقة الثنائية (2FA) لحماية حساباتك من الاختراق",
    },
    {
      "icon": Icons.link_off,
      "color": const Color.fromARGB(255, 212, 34, 34),
      "text": "تجنّب الضغط على الروابط المشبوهة أو المرسلة من مصادر غير موثوقة",
    },
    {
      "icon": Icons.https,
      "color": Colors.green,
      "text":
          "تأكد أن المواقع التي تدخلها تبدأ بـ HTTPS قبل إدخال أي بيانات حساسة",
    },
    {
      "icon": Icons.security,
      "color": Colors.orangeAccent,
      "text": "استخدم برامج حماية وتحديثها باستمرار ضد الفيروسات والاختراقات",
    },
    {
      "icon": Icons.vpn_lock,
      "color": Colors.teal,
      "text": "استخدم VPN موثوق عند الاتصال بشبكات عامة أو مفتوحة",
    },
    {
      "icon": Icons.password,
      "color": Colors.purple,
      "text":
          "اختر كلمات مرور قوية وطويلة ولا تستخدم نفس الكلمة في أكثر من حساب",
    },
    {
      "icon": Icons.backup,
      "color": Colors.indigo,
      "text": "احتفظ بنسخ احتياطية من بياناتك المهمة في مكان آمن",
    },
    {
      "icon": Icons.warning,
      "color": const Color.fromARGB(255, 226, 69, 22),
      "text": "بلغ فورًا عن أي محاولة احتيال أو تهديد إلكتروني",
    },
    {
      "icon": Icons.wifi_off,
      "color": const Color.fromARGB(255, 81, 56, 47),
      "text": "تجنب إجراء معاملات مالية عبر شبكات Wi-Fi العامة",
    },
    {
      "icon": Icons.update,
      "color": Colors.cyan,
      "text": "حدّث نظام التشغيل والتطبيقات لتفادي الثغرات الأمنية",
    },
  ];

  SecurityTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bgGradient = LinearGradient(
      colors: [
        Color.fromARGB(247, 221, 63, 52),
        Color.fromARGB(210, 221, 63, 52),
        Color.fromARGB(242, 221, 63, 52),
        Color.fromARGB(210, 221, 63, 52),
        Color.fromARGB(246, 221, 63, 52),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(title: 'نصائح أمنية', gradient: bgGradient),
      body: Container(
        decoration: const BoxDecoration(gradient: bgGradient),
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          itemCount: tips.length,
          itemBuilder: (context, index) {
            final tip = tips[index];
            return FadeInUp(
              delay: Duration(milliseconds: 100 * index),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tip["color"].withOpacity(0.2),
                    child: Icon(tip["icon"], color: tip["color"]),
                  ),
                  title: Text(
                    tip["text"],
                    style: const TextStyle(
                      color: Colors.white,
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
      ),
    );
  }
}
