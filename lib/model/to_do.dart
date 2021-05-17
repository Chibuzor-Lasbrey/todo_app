import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  final DateTime dateTime;
  final bool doneState;

  Todo({this.title, this.description, this.dateTime, this.doneState = false});
}
