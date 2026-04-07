import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_doctor/src/app_theme/app_images/app_images.dart';
import 'package:sehat_doctor/src/widget/field_widget.dart';
import 'package:sehat_doctor/src/widget/text_field_widget.dart';
import '../../../app_theme/app_colors/app_colors.dart';
import '../../../app_theme/app_icons/app_icons.dart';
import '../../../app_theme/app_styles/app_styles.dart';
import '../../../widget/button_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    controllerName.addListener(_checkFields);
    controllerLastName.addListener(_checkFields);
    controllerPhoneNumber.addListener(_checkFields);
  }

  void _checkFields() {
    final isFilled = controllerName.text.trim().isNotEmpty &&
        controllerLastName.text.trim().isNotEmpty &&
        controllerPhoneNumber.text.length == 17;

    setState(() {
      isActive = isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left_sharp),
        ),
        title: Text(
          "edit.text1".tr(),
          style: AppStyles.medium16(AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          height: 96.h,
                          width: 96.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              AppImages.person,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 60.w, top: 65.h),
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.h),
                              child: SvgPicture.asset(AppIcons.camera),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "edit.text1".tr(),
                      style: AppStyles.regular16(AppColors.black),
                    ),
                  ),
                  Gap(5.h),
                  TextFieldWidget(
                    text: "edit.text2".tr(),
                    controller: controllerName,
                  ),
                  Gap(5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "edit.text3".tr(),
                      style: AppStyles.regular16(AppColors.black),
                    ),
                  ),
                  Gap(5.h),
                  TextFieldWidget(
                    text: "edit.text3".tr(),
                    controller: controllerLastName,
                  ),
                  Gap(5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "edit.text4".tr(),
                      style: AppStyles.regular16(AppColors.black),
                    ),
                  ),
                  Gap(5.h),
                  TextFieldWidget(
                    text: "+998 _ _  _ _ _  _ _  _ _".tr(),
                    controller: controllerPhoneNumber,
                    isNumber: true,
                  ),
                ],
              ),
            ),
          ),
          Gap(16.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48,horizontal: 16),
            child: ButtonWidget(
              isActive: isActive,
              text: "edit.text5".tr(),
              onTap: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
