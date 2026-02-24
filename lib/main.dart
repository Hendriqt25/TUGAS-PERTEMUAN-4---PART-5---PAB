// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/model.dart';
import 'page/listproduct.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ProductListPage(),
    );
  }
}
