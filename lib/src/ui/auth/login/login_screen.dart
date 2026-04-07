import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat_doctor/src/widget/button_widget.dart';
import 'package:sehat_doctor/src/widget/text_field_widget.dart';

import '../../../app_theme/app_colors/app_colors.dart';
import '../../../app_theme/app_styles/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerNumber = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    _controllerNumber.addListener(_checkFields);
    _controllerPassword.addListener(_checkFields);
  }

  void _checkFields() {
    final number = _controllerNumber.text;
    final password = _controllerPassword.text.trim();

    print("Hozirgi uzunlik: ${number.length}");

    setState(() {
      // Shartni 17 yoki undan katta qilib ko'ring (yoki maskaga qarab to'g'rilang)
      isActive = number.length >= 17 && password.isNotEmpty;
    });
  }
  @override
  void dispose() {
    _controllerNumber.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(100.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "login.text1".tr(),
                    style: AppStyles.semiBold20(AppColors.black),
                  ),
                  Gap(12.h),
                  Text(
                    "login.text2".tr(),
                    style: AppStyles.regular16(AppColors.textGrey),
                  ),
                  Gap(20.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "login.text3".tr(),
                          style: AppStyles.medium14(AppColors.black),
                        ),
                        TextSpan(
                          text: " *",
                          style: AppStyles.medium14(AppColors.red),
                        ),
                      ],
                    ),
                  ),
                  Gap(8.h),
                  TextFieldWidget(
                    text: "+998 _ _  _ _ _  _ _  _ _",
                    isNumber: true,
                    controller: _controllerNumber,
                  ),
                  Gap(16.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "login.text4".tr(),
                          style: AppStyles.medium14(AppColors.black),
                        ),
                        TextSpan(
                          text: " *",
                          style: AppStyles.medium14(AppColors.red),
                        ),
                      ],
                    ),
                  ),
                  Gap(8.h),
                  TextFieldWidget(
                    text: "login.text5".tr(),
                    isPassword: true,
                    controller: _controllerPassword,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: ButtonWidget(
                  text: "continue".tr(),
                  onTap: () {},
                isActive: isActive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
