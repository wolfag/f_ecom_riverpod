import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/model/product.dart';
import 'package:f_ecom_riverpod/views/detail/components/amount_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CartItem extends ConsumerWidget {
  const CartItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Gap(27),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.img,
              fit: BoxFit.cover,
              width: 100,
            ),
            const Gap(24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    product.shortDescription,
                    style: const TextStyle(
                      color: kTextBodyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: kBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      AmountBar(
                        amount: product.qty,
                        onDecrement: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .decrementQty(product.id);
                        },
                        onIncrement: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .incrementQty(product.id);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const Gap(27),
        Container(
          width: double.infinity,
          height: 0.5,
          color: kTextBodyColor,
        ),
      ],
    );
  }
}
