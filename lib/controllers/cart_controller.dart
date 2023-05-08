// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:f_ecom_riverpod/model/product.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void selectItem(int productId) {
    state = [
      for (final p in state)
        if (p.id == productId) p.copyWith(isSelected: !p.isSelected) else p
    ];
  }

  void incrementQty(int productId) {
    state = state.map((e) {
      if (e.id == productId) {
        return e.copyWith(qty: e.qty + 1);
      } else {
        return e;
      }
    }).toList();
  }

  void decrementQty(int productId) {
    state = state
        .map((e) {
          if (e.id == productId) {
            return e.copyWith(qty: e.qty - 1);
          } else {
            return e;
          }
        })
        .where((element) => element.qty > 0)
        .toList();
  }

  void add(Product product) {
    final item = state.firstWhereOrNull((element) => element.id == product.id);

    if (item != null) {
      incrementQty(product.id);
    } else {
      state = [...state, product];
    }
  }

  void remove(int productId) {
    state = state.where((element) => element.id != productId).toList();
  }
}

final cartNotifierProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);

final subTotalProvider = StateProvider<double>(
  (ref) {
    final carts = ref.watch(cartNotifierProvider);
    return carts.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.qty);
  },
);

class TotalParams extends Equatable {
  final double discount;
  final double deliveryFree;

  const TotalParams({
    required this.discount,
    required this.deliveryFree,
  });

  @override
  List<Object?> get props => [discount, deliveryFree];
}

final totalProvider = StateProvider.family<double, TotalParams>((
  ref,
  TotalParams params,
) {
  final subtotal = ref.watch(subTotalProvider);
  return (subtotal + params.deliveryFree) * (100 - params.discount) / 100;
});
