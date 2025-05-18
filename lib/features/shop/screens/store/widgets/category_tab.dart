import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // to make the column scrollable
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              /// Below content inside the tab bar
              TBrandShowcase(images: [TImages.productImage3,TImages.productImage1, TImages.productImage2]),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              TSectionHeading(title: 'You might like', onPressed: (){}),
              SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(itemCount: 4, itemBuilder: (_, index) => TProductCardVertical()),
              SizedBox(height: TSizes.spaceBtwSections),

            ],
          ),
        ),
      ],
    );
  }
}
