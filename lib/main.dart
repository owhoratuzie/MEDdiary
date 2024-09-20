//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_diary/src/features/core/models/user_model.dart';
import 'package:med_diary/src/features/core/screens/home_screen.dart';
import 'package:med_diary/src/features/core/screens/welcome_screen.dart';
import 'package:med_diary/src/features/core/services/user_service.dart';
import 'package:med_diary/src/theme/theme.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool _hasUserData = false;
  ThemeMode _themeMode = ThemeMode.system; // Store the theme mode

  @override
  void initState() {
    super.initState();
    _checkUserData();
  }

  Future<void> _checkUserData() async {
    UserModel? user = await getUserData();
    setState(() {
      _hasUserData = user != null;
      _isLoading = false;
    });
  }

  // This is the function that will handle theme changes
  void _onThemeChange(ThemeMode newThemeMode) {
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Diary',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode, // Set theme mode here
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : (_hasUserData
              ? HomeScreen(onThemeChange: _onThemeChange)
              : const WelcomeScreen()),
      //home: const WelcomeScreen(),
      //home: const HomeScreen(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
