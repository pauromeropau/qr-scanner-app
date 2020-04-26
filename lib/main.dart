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
      routes: {'home': (BuildContext context) => HomePage()},
      theme: ThemeData(
        fontFamily: 'Helvetica Neue',
        brightness: Brightness.dark,
        accentColor: Colors.red,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
    );
  }
}
