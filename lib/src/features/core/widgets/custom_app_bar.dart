import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    height: 70,
    width: double.infinity,
    decoration: const BoxDecoration(
    //color: Colors.white,
    ));
  }
}
