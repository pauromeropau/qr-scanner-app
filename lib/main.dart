import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR-Scanner',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage()
      },
    );
  }
}
