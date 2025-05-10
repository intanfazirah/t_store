import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';


class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkerGrey : TColors.grey,
            thickness: 0.5,
            /// Indent
            /// Padding before the line start (from the left for a horizontal divider, from the top for a vertical divider).
            indent: 60,
            /// endIndent
            /// Adds padding after the line ends (from the right or bottom).
            endIndent: 5,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkerGrey : TColors.grey,
            thickness: 0.5,
            /// Indent
            /// Padding before the line start (from the left for a horizontal divider, from the top for a vertical divider).
            indent: 5,
            /// endIndent
            /// Adds padding after the line ends (from the right or bottom).
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
