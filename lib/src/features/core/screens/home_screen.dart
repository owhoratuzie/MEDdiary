import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:med_diary/src/features/core/screens/diary_screen.dart';
import 'package:med_diary/src/features/core/screens/entry_screen.dart';
import 'package:med_diary/src/features/core/screens/settings_screen.dart';
//import 'package:ionicons/ionicons.dart';
import 'package:med_diary/src/features/core/widgets/custom_botttom_navigation_bar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final void Function(ThemeMode) onThemeChange;
  const HomeScreen({super.key, required this.onThemeChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Create a GlobalKey for the ScaffoldState
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /* static const List<Widget> _widgetOptions = <Widget>[
    EntryScreen(),
    DiaryScreen(),
    SettingsScreen(),
  ]; */

  // Update _widgetOptions to include onThemeChange for SettingsScreen
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const EntryScreen(),
      const DiaryScreen(),
      SettingsScreen(
          onThemeChange: widget.onThemeChange), // Pass onThemeChange callback
    ];
  }

  void _onItemTapped(int index) {
    if (index == 4) {
      // Open the drawer using the GlobalKey
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Ionicons.add),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Tools',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12), // Customize selected label font size
        unselectedLabelStyle: const TextStyle(fontSize: 10), // Customize unselected label font size
        onTap: _onItemTapped,
      ),*/
    );
  }
}
