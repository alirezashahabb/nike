import 'package:flutter/material.dart';
import 'package:nike/data/model/banner.dart';
import 'package:nike/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'image_loading_service.dart';

class SliderSection extends StatelessWidget {
  final PageController _controller = PageController();
  final List<BannerModel> banners;

  SliderSection({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: ImageLoadingService(
                  mainImage: banners[index].imageUrl,
                  radius: 12,
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 4.0,
                    strokeWidth: 1.5,
                    dotColor: LightThemeColors.secondaryTextColor,
                    activeDotColor: LightThemeColors.secondaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
