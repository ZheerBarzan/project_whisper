import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_whisper/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: CupertinoSwitch(
          value: Provider.of<ThemeProvider>(context).isDarkMode,
          onChanged: (value) {
            Provider.of<ThemeProvider>(context, listen: false)
                .toggleThemeMode();
          },
        ),
      ),
    );
  }
}
