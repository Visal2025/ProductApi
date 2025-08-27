import 'package:flutter/material.dart';
import 'package:product_api/product_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductApi(),
      debugShowCheckedModeBanner: false,
    );
  }
}