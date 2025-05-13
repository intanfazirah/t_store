import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../products/product_cards/product_card_vertical.dart';


class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        /// Each grid item has a fixed height of 288 pixels
        /// It gives full control over item height, which is helpful when items have images, text, or buttons you want to align consistently.
        mainAxisExtent: mainAxisExtent,
      ),
      /// itemBuilder is a function that builds each individual grid item.
      /// _ is the unused BuildContext (you can name it _ if you're not using it).
      /// index is the current item position in the grid.
      itemBuilder: itemBuilder,
    );
  }
}
