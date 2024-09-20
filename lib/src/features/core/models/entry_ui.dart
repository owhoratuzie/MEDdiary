import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class EntryUIModel {
  final IconData icon;
  final String type;
  final String field;

  EntryUIModel(this.icon, this.type, this.field);

  static List<EntryUIModel> list = [
    EntryUIModel(Ionicons.heart_outline, "Blood Pressure", "Field"),
    EntryUIModel(Ionicons.water_outline, "Blood Sugar", "Field")
  ];
}

