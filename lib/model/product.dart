// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String img;
  final String title;
  final int price;
  final String shortDescription;
  final String description;
  final int review;
  final double rating;

  bool isSelected;
  int qty;

  Product({
    required this.id,
    required this.img,
    required this.title,
    required this.price,
    required this.shortDescription,
    required this.description,
    required this.review,
    required this.rating,
    this.isSelected = false,
    this.qty = 1,
  });

  Product copyWith(
      {String? img,
      String? title,
      int? price,
      String? shortDescription,
      String? description,
      int? review,
      double? rating,
      int? qty,
      bool? isSelected}) {
    return Product(
      id: id,
      img: img ?? this.img,
      title: title ?? this.title,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      qty: qty ?? this.qty,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
