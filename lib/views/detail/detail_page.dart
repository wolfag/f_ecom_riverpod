import 'package:f_ecom_riverpod/components/bottom_nav_bar.dart';
import 'package:f_ecom_riverpod/components/cart.dart';
import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/model/product.dart';

import 'package:f_ecom_riverpod/views/detail/components/amount_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: kSecondColor,
        actions: const [Cart()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.img,
              fit: BoxFit.fitWidth,
            ),
            const Gap(30),
            Container(
              padding: const EdgeInsets.only(top: 0, left: 42, right: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Gap(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar(
                        itemSize: 15,
                        initialRating: 1,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(
                            Icons.star_half_sharp,
                            color: Colors.amber,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      Text(
                        ' | ${product.review} reviews',
                        style: const TextStyle(
                          color: kBlackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Gap(13),
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
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
                  ),
                  const Gap(28),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Add item to bag',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(100),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
