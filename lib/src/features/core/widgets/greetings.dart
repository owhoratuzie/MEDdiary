import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    const double padding = 21.0;

    // Get current hour
    final now = DateTime.now();
    final currentHour = now.hour;
    //final date = now.day.toString();

    final DateFormat dateFormat =
        DateFormat('EEEE, d MMMM'); // Define date format
    final timestamp = now.toString(); // Use ISO 8601 format

    String greetingMessage;
    IconData greetingIcon;

    if (currentHour >= 0 && currentHour < 12) {
      greetingMessage = "Good Morning";
      greetingIcon = Ionicons.partly_sunny_outline;
    } else if (currentHour >= 12 && currentHour < 16) {
      greetingMessage = "Good Afternoon";
      greetingIcon = Ionicons.sunny_outline;
    } else {
      greetingMessage = "Good Evening";
      greetingIcon = Ionicons.moon_outline;
    }

    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: padding, top: 6.0),
          child: Row(
            children: [
              Text(greetingMessage, style: textTheme.headlineMedium),
              const SizedBox(width: 8),
              Icon(greetingIcon),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: padding, top: 6.0),
          child: Text(dateFormat.format(DateTime.parse(timestamp)),
              style: textTheme.headlineSmall),
        ),
      ],
    );
  }
}
