import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/constants/image_strings.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Primary blue header
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// Appbar
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections,),

                    ///SearchBar
                    TSearchContainer(text: 'Search in Store',),
                    SizedBox(height: TSizes.spaceBtwSections,),

                    /// Categories
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          /// heading
                          TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white,),
                          SizedBox(height: TSizes.spaceBtwItems),

                          ///Categories
                          THomeCategories()
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              /// Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],),

              ),
            ],
          ),
        )
    );
  }
}
















