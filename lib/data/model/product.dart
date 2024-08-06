class ProductSort {
  static const lATEST = 0;
  static const pOPULAR = 1;
  static const pRICE_hIGH_tO_lOW = 2;
  static const pRICE_LOW_TO_HIGH = 3;
}

class ProductModel {
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  final int discount;
  final int previousprice;

  ProductModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.discount,
      required this.previousprice});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      price: json['price'],
      discount: json['discount'],
      previousprice: json['previous_price'] ?? json['price'],
    );
  }
}
