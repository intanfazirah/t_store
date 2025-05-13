import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {
        super.key,
        this.title,
        this.showBackArrow = true,
        this.leadingIcon,
        this.actions,
        this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.md),
        child: AppBar(
          automaticallyImplyLeading: false,
          /// showBackArrow is a boolean. If it's true, it shows a back arrow icon using Iconsax.arrow_left.
          /// If showBackArrow is false, then it checks if leadingIcon is not null.
          /// If leadingIcon exists, it shows that icon instead.
          /// If both showBackArrow is false and leadingIcon is null, then it shows nothing (null) in the leading spot.
          leading: showBackArrow
              ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left))
              : leadingIcon != null ? IconButton(onPressed: () => Get.back(), icon: Icon(leadingIcon)) : null,
          title: title,
          actions: actions,

        ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
