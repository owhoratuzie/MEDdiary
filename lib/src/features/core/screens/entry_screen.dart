import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_diary/src/features/core/widgets/custom_app_bar.dart';
import 'package:med_diary/src/features/core/widgets/daily_entry_slider.dart';
//import 'package:med_diary/src/features/core/widgets/daily_entry_slider_items.dart';
import 'package:med_diary/src/features/core/widgets/greetings.dart';
import 'package:med_diary/src/theme/widget_themes/text_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 21.0;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          Container(
            padding: const EdgeInsets.only(left: padding),
            child: Row(
              children: [
                Text("Hi,", style: textTheme.headlineMedium),
                Text(_username != null ? " $_username" : " Loading...",
                    style: textTheme.headlineMedium),
              ],
            ),
          ),
          const Greetings(),
          const DailyEntrySlider(),
        ],
      ),
    ));
  }
}
