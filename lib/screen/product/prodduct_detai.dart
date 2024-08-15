import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/common/constant.dart';
import 'package:nike/data/model/product.dart';
import 'package:nike/theme.dart';
import 'package:nike/widget/image_loading_service.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel products;
  const ProductDetail({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    TextTheme themeData = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width * 0.8,
            flexibleSpace: ImageLoadingService(mainImage: products.imageUrl),
            foregroundColor: LightThemeColors.primaryTextColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.title,
                          style: themeData.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        products.previousprice.withPriceLabel,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      Text(products.price.withPriceLabel),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                  ' کتونی، کفشی است که برای لباس‌های ورزشی یا فعالیت‌های روزمره طراحی شده است. کفش‌های کتونی معمولاً یک زیره طبی و رویه با کیفیت دارند که روی پا را می‌پوشانند'),
            ),
          ),
        ],
      ),
    );
  }
}