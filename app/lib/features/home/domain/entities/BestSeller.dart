class BookSeller {
  String id;
  String imageLink;
  String title;
  String originalPrice;
  String discountedPrice;
  int soldQuantity;

  BookSeller({
    required this.id,
    required this.imageLink,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.soldQuantity,
  });

  factory BookSeller.fromJson(Map<String, dynamic> json) {
    return BookSeller(
      id: json['id'],
      imageLink: json['imageLink'],
      title: json['title'],
      originalPrice: json['originalPrice'],
      discountedPrice: json['discountedPrice'],
      soldQuantity: json['soldQuantity'],
    );
  }
}