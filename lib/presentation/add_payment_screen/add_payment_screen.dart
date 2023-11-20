import 'package:flutter/material.dart';
import 'package:suresh_s_application1/core/app_export.dart';
import 'package:suresh_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:suresh_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:suresh_s_application1/widgets/app_bar/custom_app_bar.dart';

class AddPaymentScreen extends StatelessWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  _buildPaymentOption(context,
                      paypalIcon: ImageConstant.imgCreditCardIcon,
                      paypalLabel: "msg_credit_card_or_debit".tr,
                      onTapPaymentOption: () {
                    onTapPaymentOption(context);
                  }),
                  _buildPaymentOption(context,
                      paypalIcon: ImageConstant.imgPaypalIcon,
                      paypalLabel: "lbl_paypal".tr),
                  SizedBox(height: 5.v),
                  _buildPaymentOption(context,
                      paypalIcon: ImageConstant.imgAirplanePrimary,
                      paypalLabel: "lbl_bank_transfer".tr)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_payment".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildPaymentOption(
    BuildContext context, {
    required String paypalIcon,
    required String paypalLabel,
    Function? onTapPaymentOption,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPaymentOption!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(children: [
              CustomImageView(
                  imagePath: paypalIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 4.v),
                  child: Text(paypalLabel,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the creditCardAndDebitScreen when the action is triggered.
  onTapPaymentOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.creditCardAndDebitScreen);
  }
}
