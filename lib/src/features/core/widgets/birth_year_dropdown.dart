/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthYearDropDown extends StatefulWidget {
  final Function(int) onYearSelected;

  const BirthYearDropDown({required this.onYearSelected, super.key});

  @override
  State<BirthYearDropDown> createState() => _BirthYearDropDownState();
}

class _BirthYearDropDownState extends State<BirthYearDropDown> {

  int? selectedYear;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textFieldWidth = screenWidth - 40;
    final dropDownWidth = textFieldWidth / 2;
    final mainDropDownWidth = dropDownWidth - 6;

    const double textFieldHeight = 45.0;

    return GestureDetector(
      onTap: () {
        _showYearInputDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        width: mainDropDownWidth,
        height: textFieldHeight,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(25.0), // Curved edges
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedYear?.toString() ?? 'Year',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down_sharp, color: Colors.white, size: 23),
          ],
        ),
      ),
    );
  }

  void _showYearInputDialog(BuildContext context) {
    TextEditingController yearController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Birth Year'),
          content: TextField(
            controller: yearController,
            keyboardType: TextInputType.number,
            maxLength: 4,
            decoration: const InputDecoration(
              hintText: 'YYYY',
              counterText: '',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final year = int.tryParse(yearController.text);
                if (year != null) {
                  widget.onYearSelected(year);
                }
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

*/


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BirthYearDropDown extends StatefulWidget {
  final Function(int) onYearSelected;
  const BirthYearDropDown({ required this.onYearSelected, super.key});


  @override
  State<BirthYearDropDown> createState() => _BirthYearDropDownState();
}

class _BirthYearDropDownState extends State<BirthYearDropDown> {


  //final TextEditingController yearController = TextEditingController();

  int? inputYear;

  @override

  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    final textFieldWidth = screenWidth - 40;
    final dropDownWidth = textFieldWidth / 2;
    final mainDropDownWidth = dropDownWidth - 6;
    //final mainDropDownHeight = screenHeight / 2;


    const double textFieldHeight = 45.0;


    return GestureDetector(
      onTap: () => _showYearInputDialog(context),
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
            Text(inputYear?.toString() ?? 'Year',
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down_sharp, color: Colors.white, size: 23)
          ],
        ),
      ),
    );

  }


  void _showYearInputDialog(BuildContext context) {
    TextEditingController yearController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Birth Year'),
          content: TextField(
            controller: yearController,
            keyboardType: TextInputType.number,
            maxLength: 4,
            decoration: const InputDecoration(
              hintText: 'YYYY',
              counterText: '',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final year = int.tryParse(yearController.text);
                if (year != null) {
                  setState(() {
                    inputYear = year;
                  });
                  widget.onYearSelected(year);
                }
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }



}


