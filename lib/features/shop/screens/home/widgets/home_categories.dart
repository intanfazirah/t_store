import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../constants/image_strings.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    if(categoryController.featuredCategories.isEmpty){
      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
    }

    return Obx(() {
      if(categoryController.isLoading.value) return const TCategoryShimmer();
        return SizedBox(
          height: 80,
          child: ListView.builder(
            /// Without shrinkWrap: true, ListView tries to take up infinite vertical space (which can cause layout issues inside a Column or similar).
            /// With shrinkWrap: true, it sizes itself to fit its children.
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(image: category.image, title: category.name, onTap: () => Get.to(() => SubCategoriesScreen()));
            },
          ),
        );
      }
    );
  }
}