import 'package:flutter/material.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/widget/product_item.dart';

class HorizontallyProducts extends StatelessWidget {
  final List<ProductModel> products;

  const HorizontallyProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var productsItems = products[index];
          return ProductItems(productsItems: productsItems);
        },
      ),
    );
  }
}
