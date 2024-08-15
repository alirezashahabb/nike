import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/common/constant.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/screen/product/prodduct_detai.dart';
import 'package:nike/widget/image_loading_service.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    super.key,
    required this.productsItems,
  });

  final ProductModel productsItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        radius: 8,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ProductDetail(
                products: productsItems,
              );
            },
          ));
        },
        child: SizedBox(
          width: 176,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 189,
                    width: 176,
                    child: ImageLoadingService(
                      mainImage: productsItems.imageUrl,
                      radius: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productsItems.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      productsItems.previousprice.withPriceLabel,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(decoration: TextDecoration.lineThrough),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Text(
                      productsItems.price.withPriceLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(CupertinoIcons.heart),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
