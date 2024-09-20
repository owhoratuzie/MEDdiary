import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodGlucoseUnits extends StatefulWidget {
  final ValueChanged<String> onUnitSelected;
  const BloodGlucoseUnits({super.key, required this.onUnitSelected});

  @override
  State<BloodGlucoseUnits> createState() => _BloodGlucoseUnitsState();
}

class _BloodGlucoseUnitsState extends State<BloodGlucoseUnits> {


  String? _selectedUnit;

  final List<String> _units = [
    "mmol/L",  //
    "mg/dL",
  ];


  void _showUnitPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Unit'),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _units.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_units[index]),
                  onTap: () {
                    final selectedUnit = _units[index];
                    widget.onUnitSelected(selectedUnit);
                    setState(() {
                      _selectedUnit = selectedUnit;
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
    final dropDownWidth = textFieldWidth / 3;
    final mainDropDownWidth = dropDownWidth - 13;

    const double textFieldHeight = 45.0;

    return GestureDetector(
      onTap: () => _showUnitPicker(context),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 10.0),
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
              _selectedUnit ?? "mmol/L",
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
