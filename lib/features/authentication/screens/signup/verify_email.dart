import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/constants/image_strings.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  get sizedBox => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Remove back arrow button
        automaticallyImplyLeading: false,
        /// Actions always from right side
        actions: [
          IconButton(onPressed: () => Get.offAll(() => LoginScreen()), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(image: AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,),
                SizedBox(height: TSizes.spaceBtwSections),
                
                /// Title & SubTitle
                Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems),
                Text('support@abc.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                        image: TImages.staticSuccessIllustration,
                        title: TTexts.yourAccountCreatedTitle,
                        subTitle: TTexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(()=> LoginScreen()),
                      )),
                      child: Text(TTexts.tContinue)),
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: () {}, child: Text(TTexts.resendEmail)),
                ),
              ],
            ),
        ),
      ),

    );
  }
}
