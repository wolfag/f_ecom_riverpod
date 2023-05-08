import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/views/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Badge(
        smallSize: 12,
        label: Text(
          ref.watch(cartNotifierProvider).length.toString(),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CartPage(),
              ),
            );
          },
          icon: const Icon(Icons.local_mall_outlined),
        ),
      ),
    );
  }
}
