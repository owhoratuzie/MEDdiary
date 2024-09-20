import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:med_diary/src/features/core/widgets/custom_app_bar.dart';
//import 'package:med_diary/src/theme/widget_themes/text_theme.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(ThemeMode) onThemeChange;
  const SettingsScreen({Key? key, required this.onThemeChange})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedTheme = 'system';

  /* void _onThemeSelected(String? value) {
    if (value != null) {
      ThemeMode themeMode;
      switch (value) {
        case 'light':
          themeMode = ThemeMode.light;
          break;
        case 'dark':
          themeMode = ThemeMode.dark;
          break;
        case 'system':
        default:
          themeMode = ThemeMode.system;
          break;
      }
      setState(() {
        _selectedTheme = value;
      });
      widget.onThemeChange(
          themeMode); // Call the function to update the theme in main.dart
    }
  }
 */
  /* void _onThemeSelected(String? value) {
    /* if (value != null) {
      ThemeMode themeMode;
      switch (value) {
        case 'light':
          themeMode = ThemeMode.light;
          break;
        case 'dark':
          themeMode = ThemeMode.dark;
          break;
        case 'system':
        default:
          themeMode = ThemeMode.system;
          break;
      }
      setState(() {
        _selectedTheme = value;
      });
      widget.onThemeChange(
          themeMode); // Call the function to update the theme in main.dart
    } */
  } */

  void _onThemeSelected(String? value) {
    if (value != null) {
      ThemeMode themeMode;
      switch (value) {
        case 'light':
          themeMode = ThemeMode.light;
          break;
        case 'dark':
          themeMode = ThemeMode.dark;
          break;
        case 'system':
        default:
          themeMode = ThemeMode.system;

          break;
      }

      setState(() {
        _selectedTheme = value;
      });

      Future.delayed(Duration.zero, () {
        widget.onThemeChange(themeMode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Container(
                padding: const EdgeInsets.only(
                  top: 0.0,
                ),
                child: Row(
                  children: [
                    Text('Settings ', style: textTheme.headlineMedium),
                    const Icon(Ionicons.settings_outline),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                    left: 0.0, right: 0.0, bottom: 10.0, top: 21.0),
                padding:
                    const EdgeInsets.only(right: 21.0, left: 21.0, top: 21.0),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Select Mode",
                          style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedTheme,
                        items: [
                          DropdownMenuItem(
                            value: 'light',
                            child: Text(
                              'Light',
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'dark',
                            child: Text(
                              'Dark',
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'system',
                            child: Text(
                              'System Default',
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                          ),
                        ],
                        onChanged: _onThemeSelected,
                      ),
                    ]))
          ],
        ),
      )),
    );
  }
}
