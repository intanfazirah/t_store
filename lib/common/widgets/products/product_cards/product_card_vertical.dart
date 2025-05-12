import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadows.dart';
import 'package:t_store/common/widgets/images/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/constants/image_strings.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../icons/t_circular_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius, shadows
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Column(
        children: [
          /// Thumbnail, Wishlist button, Discount Tag
          TRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true,),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),

                /// -- Favourite Icon Button
                Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red)),
              ],
            ),
          ),


          /// -- Details
        ],
      ),
    );
  }
}


