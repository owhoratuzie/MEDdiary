import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_diary/src/features/core/models/user_model.dart';
import 'package:med_diary/src/features/core/screens/home_screen.dart';
import 'package:med_diary/src/features/core/services/user_service.dart';
import 'package:med_diary/src/features/core/widgets/birth_month_dropdown.dart';
import 'package:med_diary/src/features/core/widgets/birth_year_dropdown.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _usernameController = TextEditingController();
  int? _birthMonth;
  int? birthYear;

  void _saveUser() async {
    final username = _usernameController.text;
    if (username.isEmpty || _birthMonth == null || birthYear == null) {
      return; // Handle empty fields
    }
    final user = UserModel(username, _birthMonth!, birthYear!);
    await saveUserData(user);
    //await _savePreferences(username, _birthMonth!, birthYear!);
    if (!mounted) return;
    _navigateToHome();
  }

  // Future<void> _savePreferences(String username, int birthMonth, int birthYear) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('username', username);
  //   await prefs.setInt('birthMonth', birthMonth);
  //   await prefs.setInt('birthYear', birthYear);
  // }

// This is the function to handle theme change, which should be passed to HomeScreen
  void _onThemeChange(ThemeMode newThemeMode) {
    // Implement theme change logic here, for example:
    //print('Theme changed to: $newThemeMode');
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen(onThemeChange: _onThemeChange)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textFieldWidth = screenWidth - 40;

    const double padding = 21.0;
    const double textFieldHeight = 45.0;

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Text(
                        "MEDdiary",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            letterSpacing: -1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Text("Welcome", style: textTheme.headlineMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: padding,
                    ),
                    child: Text("Username", style: textTheme.bodySmall),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: padding, vertical: 8.0),
                      child: SizedBox(
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: TextField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(hintText: 'Username'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: padding,
                    ),
                    child:
                        Text("When were you born?", style: textTheme.bodySmall),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: padding, vertical: 8.0),
                      child: SizedBox(
                        height: textFieldHeight,
                        width: textFieldWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BirthMonthDropDown(
                              onMonthSelected: (month) {
                                setState(() {
                                  _birthMonth = month;
                                });
                              },
                            ),
                            BirthYearDropDown(
                              onYearSelected: (selectedYear) {
                                setState(() {
                                  birthYear = selectedYear;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _saveUser,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: padding, vertical: 8.0),
                      width: textFieldWidth,
                      height: textFieldHeight,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(25.0), // Curved edges
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
