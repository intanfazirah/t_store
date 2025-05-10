import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Form(child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),

            SizedBox(width: TSizes.spaceBtwInputFields,),

            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Username
        TextFormField(
          decoration: const InputDecoration(
            labelText: TTexts.username,
            prefixIcon: Icon(Iconsax.user_edit),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Email
        TextFormField(
          decoration: const InputDecoration(
            labelText: TTexts.email,
            prefixIcon: Icon(Iconsax.direct),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Phone Number
        TextFormField(
          decoration: const InputDecoration(
            labelText: TTexts.phoneNo,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields,),

        /// Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: TTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections,),

        /// Terms&Conditions Checkbox
        TTermsAndConditionCheckbox(),
        SizedBox(height: TSizes.spaceBtwSections,),

        /// Sign Up Button
        /// width: double.infinity → meaning it will expand to the maximum width available from its parent.
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => VerifyEmailScreen()), child: Text(TTexts.createAccount)),)
      ],
    ),
    );
  }
}

