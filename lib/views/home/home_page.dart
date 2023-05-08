import 'package:f_ecom_riverpod/components/bottom_nav_bar.dart';
import 'package:f_ecom_riverpod/components/cart.dart';
import 'package:f_ecom_riverpod/constants/assets_constants.dart';
import 'package:f_ecom_riverpod/constants/themes.dart';
import 'package:f_ecom_riverpod/views/home/components/feature_products.dart';
import 'package:f_ecom_riverpod/views/home/components/filter_bar.dart';
import 'package:f_ecom_riverpod/views/home/components/home_banner.dart';
import 'package:f_ecom_riverpod/views/home/components/hot_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AssetsConstants.storeBrandWhite,
          colorFilter: const ColorFilter.mode(kWhiteColor, BlendMode.srcIn),
          width: 180,
        ),
        backgroundColor: kSecondColor,
        actions: const [
          Cart(),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeBanner(),
            FilterBar(),
            Gap(12),
            HotSales(),
            Gap(24),
            FeaturedProducts(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
