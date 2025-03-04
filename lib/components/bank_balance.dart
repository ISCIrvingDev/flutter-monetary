import 'package:flutter/material.dart';

List<Widget> bankBalance(double balance) {
  return [Text('Bank Balance'), SizedBox(height: 20), Text(('$balance'))];
}
