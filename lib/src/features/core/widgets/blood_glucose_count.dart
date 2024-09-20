import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:med_diary/src/features/database/databasehelper.dart';

class BloodGlucoseCount extends StatefulWidget {
  const BloodGlucoseCount({super.key});

  @override
  State<BloodGlucoseCount> createState() => _BloodGlucoseCountState();
}

class _BloodGlucoseCountState extends State<BloodGlucoseCount> {
  List<Map<String, dynamic>> _bloodGlucoseEntries =
      []; // List to store fetched data
  int _totalEntries = 0; // To show the total number of entries
  String _averageResult = 'N/A'; // To display average result of blood pressure

  @override
  void initState() {
    super.initState();
    _fetchBloodGlucoseData(); // Fetch data when widget initializes
  }

// Function to fetch blood pressure data from the database
  Future<void> _fetchBloodGlucoseData() async {
    final entries = await DatabaseHelper()
        .getAllBloodGlucose(); // Assuming a method that gets all BP entries

    if (entries.isNotEmpty) {
      int totalBloodGlucose = 0;

      // Calculate total and average
      for (var entry in entries) {
        totalBloodGlucose += (entry['glucose_level'] as int);
      }

      setState(() {
        _bloodGlucoseEntries = entries;
        _totalEntries = entries.length;
        _averageResult =
            "${(totalBloodGlucose / _totalEntries).toStringAsFixed(0)} mmol/L";
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
                  Text("Blood Glucose Level", style: textTheme.headlineMedium),
                  const Icon(Ionicons.water_outline),
                ],
              ),
              SizedBox(
                width: 300,
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
                          )
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
                  itemCount: _bloodGlucoseEntries.length,
                  itemBuilder: (context, index) {
                    final entry = _bloodGlucoseEntries[index];
                    return ListTile(
                      title: Text(
                        'Blood Glucose: ${entry['glucose_level']} mmol/L',
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
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
