import 'package:f_ecom_riverpod/controllers/cart_controller.dart';
import 'package:f_ecom_riverpod/controllers/product_controller.dart';
import 'package:f_ecom_riverpod/views/detail/detail_page.dart';
import 'package:f_ecom_riverpod/views/home/components/product_card.dart';
import 'package:f_ecom_riverpod/views/home/components/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class HotSales extends ConsumerWidget {
  const HotSales({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider.notifier).hotSales;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SectionHeader(
            headerText: 'Hot Sales',
            onSeeAll: () {},
          ),
          const Gap(9),
          SizedBox(
            width: double.infinity,
            height: 270,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products.elementAt(index);
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 20,
                  child: ProductCard(
                    product: product,
                    onPlus: () {
                      // ref
                      //     .read(cartNotifierProvider.notifier)
                      //     .selectItem(product.id);

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
          ),
        ],
      ),
    );
  }
}
