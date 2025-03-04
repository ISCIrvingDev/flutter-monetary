import 'package:shared_preferences/shared_preferences.dart';

class MainService {
  setBalance(double balance) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an double value to 'decimal' key.
    await prefs.setDouble('balance', balance);
  }

  Future<double> getBalance() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try reading data from the 'decimal' key. If it doesn't exist, returns null.
    final double balance = prefs.getDouble('balance') ?? 0.0;

    return balance;
  }
}
