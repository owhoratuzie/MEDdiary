import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthMonthDropDown extends StatefulWidget {
  final ValueChanged<int> onMonthSelected;
  const BirthMonthDropDown({super.key, required this.onMonthSelected});


  @override
  State<BirthMonthDropDown> createState() => _BirthMonthDropDownState();
}

class _BirthMonthDropDownState extends State<BirthMonthDropDown> {


  String? _selectedMonth;

  final List<Map<String, String>> _months = [
    {'name': 'January', 'value': '1'},
    {'name': 'February', 'value': '2'},
    {'name': 'March', 'value': '3'},
    {'name': 'April', 'value': '4'},
    {'name': 'May', 'value': '5'},
    {'name': 'June', 'value': '6'},
    {'name': 'July', 'value': '7'},
    {'name': 'August', 'value': '8'},
    {'name': 'September', 'value': '9'},
    {'name': 'October', 'value': '10'},
    {'name': 'November', 'value': '11'},
    {'name': 'December', 'value': '12'},
  ];


  void _showMonthPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Month'),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _months.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_months[index]['name']!),
                  onTap: () {
                    final monthValue = int.parse(_months[index]['value']!);
                    widget.onMonthSelected(monthValue);
                    setState(() {
                      _selectedMonth = _months[index]['name'];
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final textFieldWidth = screenWidth - 40;
    final dropDownWidth = textFieldWidth / 2;
    final mainDropDownWidth = dropDownWidth - 6;

    const double textFieldHeight = 45.0;

    return GestureDetector(
      onTap: () => _showMonthPicker(context),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        width: mainDropDownWidth,
        height: textFieldHeight,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(25.0), // Curved edges
        ),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedMonth ?? 'Month',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down_sharp, color: Colors.white, size: 23,)
          ],
        ),
      ),
    );
  }
}
