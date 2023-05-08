import 'package:f_ecom_riverpod/mock/product_list.dart';
import 'package:f_ecom_riverpod/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(productItems);

  List<Product> get hotSales => state.sublist(0, 5);

  List<Product> get featuredProducts => state.sublist(2, 6);
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) => ProductNotifier(),
);
