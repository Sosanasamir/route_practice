import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_practice/cart_screen.dart';
import 'package:route_practice/home_screen.dart';
import 'package:route_practice/tools/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'cart': (context) => CartScreen(), 
      },
    );
  }
}
