import 'package:flutter/material.dart';

class AddMoney extends StatelessWidget {
  final Function(double val) callback;

  const AddMoney({super.key, required this.callback});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red[400],
      minimumSize: Size(double.infinity, 0),
    ),
    onPressed: () => callback(500),
    child: Text('Add Money'),
  );
}

// void onPressedHandler(double balance) {
//   balance = balance + 500;
// }
