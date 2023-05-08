import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/controllers/product_controller.dart';
import 'package:f_ecom_riverpod/views/detail/detail_page.dart';
import 'package:f_ecom_riverpod/views/home/components/product_card.dart';
import 'package:f_ecom_riverpod/views/home/components/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

class FeaturedProducts extends ConsumerWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products =
        ref.watch(productNotifierProvider.notifier).featuredProducts;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SectionHeader(
            headerText: "Featured Products",
            onSeeAll: () {},
          ),
          const Gap(9),
          MasonryGridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            shrinkWrap: true,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final product = products.elementAt(index);
              return SizedBox(
                height: 250,
                child: ProductCard(
                  product: product,
                  onPlus: () {
                    ref.read(cartNotifierProvider.notifier).add(product);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          product: product,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
