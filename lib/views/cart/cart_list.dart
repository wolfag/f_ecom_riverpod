import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/views/cart/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartList extends ConsumerWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: ref.watch(cartNotifierProvider).length,
      itemBuilder: (context, index) {
        final item = ref.watch(cartNotifierProvider).elementAt(index);
        return CartItem(product: item);
      },
    );
  }
}
