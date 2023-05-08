import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/model/product.dart';
import 'package:f_ecom_riverpod/views/cart/cart_page.dart';
import 'package:f_ecom_riverpod/views/detail/detail_page.dart';
import 'package:f_ecom_riverpod/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      // home: const CartPage(),
      home: const HomePage(),
    );
  }
}
