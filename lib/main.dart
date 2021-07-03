import 'package:flutter/material.dart';
import 'package:paymentscreen/screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sero App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CartScreen(),
    );
  }
}

