import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_theme/app_colors/app_colors.dart';
import '../app_theme/app_styles/app_styles.dart';


class FieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? iconPath;

  const FieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 326.w,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          isCollapsed: true,
          hintText: hintText,
          hintStyle: AppStyles.regular14(AppColors.textGrey),
          prefixIcon: iconPath != null
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SvgPicture.asset(
              iconPath!,
              height: 20.h,
              width: 20.w,
            ),
          )
              : null,
          contentPadding: iconPath == null
              ? EdgeInsets.symmetric(horizontal: 20.w)
              : EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}