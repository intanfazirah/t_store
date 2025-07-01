import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/all_brands.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_cart.dart';
import '../../controllers/category_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCountericon(onPressed: (){}),
          ],
        ),
      
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
          return[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
      
              flexibleSpace:  Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwSections),
      
                      /// Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => AllBrandsScreen())),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),
      
                      /// Brands Grid
                      TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                        return TBrandCard(showBorder:false);
                      }),
                    ],
                  ),
              ),
      
              /// Tabs
              bottom: TTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
              ),
            ),
          ];
        },
            /// Body
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}
