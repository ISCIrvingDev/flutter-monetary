import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Widget> bankBalance(double balance) {
  return [
    Text('Bank Balance'),
    SizedBox(height: 20),
    Text(
      '\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
  ];
}
