import 'package:f_ecom_riverpod/components/bottom_nav_bar.dart';
import 'package:f_ecom_riverpod/components/cart.dart';
import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/model/product.dart';
import 'package:f_ecom_riverpod/views/cart/cart_list.dart';
import 'package:f_ecom_riverpod/views/cart/components/cart_detail.dart';
import 'package:f_ecom_riverpod/views/cart/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: kSecondColor,
        actions: const [Cart()],
      ),
      body: Container(
        padding: const EdgeInsets.all(27),
        child: Column(
          children: const [
            Expanded(
              child: CartList(),
            ),
            Gap(15),
            Expanded(
              child: CartDetail(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
