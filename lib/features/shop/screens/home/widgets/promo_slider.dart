import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              /// Whenever the page change, it will give new index to the function
              onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        /// for the dots below carousel
        Center(
          child: Obx(
            /// () => is a function
            () => Row(
              /// MainAxisSize.min tells the widget to shrink to fit its children along the main axis (horizontal for Row, vertical for Column).
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length ; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}