import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        /// Without shrinkWrap: true, ListView tries to take up infinite vertical space (which can cause layout issues inside a Column or similar).
        /// With shrinkWrap: true, it sizes itself to fit its children.
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {

          return TVerticalImageText(image: TImages.shoeIcon, title: 'Shoes', onTap: (){},);
        },
      ),
    );
  }
}