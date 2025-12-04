import 'package:depi_project/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wb_sunny, color: Colors.orange),
        Switch(
          value: themeNotifier.isDarkMode,
          onChanged: (value) => themeNotifier.toggleTheme(),
          activeColor: Colors.indigo,
          inactiveThumbColor: Colors.orange,
        ),
        const Icon(Icons.nightlight_round, color: Colors.indigo),
      ],
    );
  }
}


