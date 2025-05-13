import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';


class TCartCountericon extends StatelessWidget {
  const TCartCountericon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        /// shopping bag/cart icon
        IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag,
          color: dark ? TColors.white : TColors.black
        )),
        /// the black circle above cart icon to indicate the cart is now not empty
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            /// the number inside circle
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}