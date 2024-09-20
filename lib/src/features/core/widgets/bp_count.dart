import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:med_diary/src/features/database/databasehelper.dart';

class BPCount extends StatefulWidget {
  const BPCount({super.key});

  @override
  State<BPCount> createState() => _BPCountState();
}

class _BPCountState extends State<BPCount> {
  List<Map<String, dynamic>> _bloodPressureEntries =
      []; // List to store fetched data
  int _totalEntries = 0; // To show the total number of entries
  String _averageResult = 'N/A'; // To display average result of blood pressure

  @override
  void initState() {
    super.initState();
    _fetchBloodPressureData(); // Fetch data when widget initializes
  }

  // Function to fetch blood pressure data from the database
  Future<void> _fetchBloodPressureData() async {
    final entries = await DatabaseHelper()
        .getAllBloodPressure(); // Assuming a method that gets all BP entries

    if (entries.isNotEmpty) {
      int totalSystolic = 0;
      int totalDiastolic = 0;

      // Calculate total and average
      for (var entry in entries) {
        totalSystolic += (entry['systolic'] as int);
        totalDiastolic += (entry['diastolic'] as int);
      }

      setState(() {
        _bloodPressureEntries = entries;
        _totalEntries = entries.length;
        _averageResult =
            "${(totalSystolic / _totalEntries).toStringAsFixed(0)}/${(totalDiastolic / _totalEntries).toStringAsFixed(0)} mmHg";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = 100.0;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Blood Pressure ", style: textTheme.headlineMedium),
                  const Icon(Ionicons.heart_outline),
                ],
              ),
              SizedBox(
                width: 300.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 21.0, right: 16.0),
                      //color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _averageResult,
                            style: textTheme.headlineMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Average Result',
                                style: textTheme.bodySmall),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.black12,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 21.0, left: 16.0),
                      width: width,
                      //color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_totalEntries.toString(),
                              style: textTheme.headlineMedium),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Total Entries',
                                style: textTheme.bodySmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              left: 0.0, right: 0.0, bottom: 10.0, top: 7.0),
          padding: const EdgeInsets.only(right: 21.0, left: 21.0),
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 7.0, bottom: 16.0),
              ),
              Expanded(
                // Expanded widget allows the ListView to take the remaining space
                child: ListView.builder(
                  itemCount: _bloodPressureEntries.length,
                  itemBuilder: (context, index) {
                    final entry = _bloodPressureEntries[index];
                    return ListTile(
                      title: Text(
                        'Systolic: ${entry['systolic']} / Diastolic: ${entry['diastolic']} mmHg',
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      subtitle: Text(
                        'Date: ${entry['date']}',
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
