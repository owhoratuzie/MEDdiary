import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
//import 'package:med_diary/src/features/core/widgets/bloodglucose_units.dart';
import 'package:med_diary/src/features/database/databasehelper.dart';

class DailyEntrySlider2 extends StatefulWidget {
  const DailyEntrySlider2({super.key});

  @override
  State<DailyEntrySlider2> createState() => _DailyEntrySlider2State();
}

class _DailyEntrySlider2State extends State<DailyEntrySlider2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Controllers for input fields
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _glucoseLevelController = TextEditingController();

  // Save data to database
  Future<void> _saveData() async {
    if (_currentPage == 0) {
      // Save blood pressure
      int systolic = int.parse(_systolicController.text);
      int diastolic = int.parse(_diastolicController.text);
      await DatabaseHelper().insertBloodPressure(
          systolic, diastolic, DateTime.now().toIso8601String());
      print("Blood Pressure saved!");
    } else if (_currentPage == 1) {
      // Save blood glucose
      int glucoseLevel = int.parse(_glucoseLevelController.text);
      await DatabaseHelper().insertBloodGlucose(
          glucoseLevel, 'mg/dL', DateTime.now().toIso8601String());
      print("Blood Glucose saved!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    //final textFieldWidth = screenWidth / 2;
    final dropDownWidth = screenWidth / 4;

    //const double padding = 21.0;
    const double textFieldHeight = 45.0;

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(
          height: 300.0,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              SizedBox(
                height: 250,
                width: 300,
                //color: Colors.red,
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Ionicons.heart_outline,
                          size: 100.0,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Blood Pressure",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6.0),
                            child: SizedBox(
                              height: textFieldHeight,
                              width: dropDownWidth - 30,
                              child: TextField(
                                controller: _systolicController,
                                maxLength: 3,
                                decoration: const InputDecoration(
                                  hintText: '000',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0), // Center vertically
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      //textAlign: TextAlign.center, // Center the hint text
                                      ),
                                ),
                                textAlign:
                                    TextAlign.center, // Center the text input
                              ),
                            ),
                          ),
                          Text(
                            "/",
                            style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            child: SizedBox(
                              height: textFieldHeight,
                              width: dropDownWidth - 30,
                              child: TextField(
                                maxLength: 3,
                                controller: _diastolicController,
                                decoration: const InputDecoration(
                                  hintText: '00',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0), // Center vertically
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      //textAlign: TextAlign.center, // Center the hint text
                                      ),
                                ),
                                textAlign:
                                    TextAlign.center, // Center the text input
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "mmHg",
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                //color: Colors.blue,
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Ionicons.water_outline,
                          size: 100.0,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Blood Glucose Level",
                          style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 6.0),
                            child: SizedBox(
                              height: textFieldHeight,
                              width: dropDownWidth,
                              child: TextField(
                                controller: _glucoseLevelController,
                                decoration: const InputDecoration(
                                  hintText: '00',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0), // Center vertically
                                  hintStyle: TextStyle(
                                      //textAlign: TextAlign.center, // Center the hint text
                                      ),
                                ),
                                textAlign:
                                    TextAlign.center, // Center the text input
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "mmol/L",
                              style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          /* BloodGlucoseUnits(
                            onUnitSelected: (String selectedUnit) {},
                          ) */
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(2, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 10,
                width: _currentPage == index ? 30 : 10,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
        ),
        GestureDetector(
          onTap: _saveData,
          child: Container(
            margin: const EdgeInsets.only(
                left: 21.0, right: 21.0, bottom: 0.0, top: 6.0),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                "Save",
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
