import 'package:flutter/material.dart';
import 'package:monetary/components/bank_balance.component.dart';

import 'components/add_monetary.component.dart';
import 'services/main.service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Monetaru'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainService mainSerive = MainService();
  double balance = 0;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mainSerive.getBalance().then(
        (val) => setState(() => balance = val),
        onError: (err) => print(err),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
          255,
          29,
          29,
          29,
        ), // Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: const Color.fromARGB(255, 54, 54, 54),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bankBalance(balance),
              ),
            ),
            Expanded(
              flex: 1,
              child: AddMoney(
                callback: (double val) {
                  setState(() {
                    balance = balance + val;
                    mainSerive.setBalance(balance);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
