import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:ionicons/ionicons.dart';
//import 'package:med_diary/src/features/core/models/entry_ui.dart';
import 'package:med_diary/src/features/core/widgets/daily_entry_slider_items.dart';

class DailyEntrySlider extends StatefulWidget {
  const DailyEntrySlider({super.key});

  @override
  State<DailyEntrySlider> createState() => _DailyEntrySliderState();
}

class _DailyEntrySliderState extends State<DailyEntrySlider> {
  @override
  Widget build(BuildContext context) {
    //const double padding = 21.0;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              left: 21.0, right: 21.0, bottom: 0.0, top: 45.0),
          padding: const EdgeInsets.all(21.0),
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const Column(
            children: [
              /* Padding(
                padding: const EdgeInsets.only(top: 23.0, bottom: 16.0),
                child: Text(
                  "Daily Entry",
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ),
              ), */
              Padding(padding: EdgeInsets.only(top: 7.0, bottom: 0.0)),
              DailyEntrySlider2(), // Pass callback),
            ],
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     _onSaveData; // Save data on tap
        //     print("Container tapped");
        //   },
        //   child: Container(
        //     margin: const EdgeInsets.only(
        //         left: 21.0, right: 21.0, bottom: padding, top: 6.0),
        //     height: 45,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //       color: Colors.black,
        //       borderRadius: BorderRadius.circular(25.0),
        //     ),
        //     child: Center(
        //       child: Text(
        //         "Save",
        //         style: GoogleFonts.outfit(
        //           textStyle: const TextStyle(
        //             color: Colors.white,
        //             fontSize: 13,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
