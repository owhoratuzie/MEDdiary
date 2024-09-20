import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';


class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 10.0),
      height: 60,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Ionicons.pencil_outline, 'Entry', 0),
          _buildNavItem(Ionicons.book_outline, 'Diary', 1),
          _buildNavItem(Icons.person_2_outlined, 'Settings', 2),
        ],
      ),
    );
  }



  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 20.0,
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontSize: isSelected ? 12.0 : 10.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
