import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/constants/image_strings.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
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
                child: Column(
                  children: [
                    /// Promo Slider
                    TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Heading
                    TSectionHeading(title: 'Popular Products', onPressed: () {},),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Popular Products
                    TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical()),
                  ],
                ),

              ),
            ],
          ),
        )
    );
  }
}
















