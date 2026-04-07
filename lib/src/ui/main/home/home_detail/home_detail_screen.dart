import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_icons/app_icons.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';

import '../../../../app_theme/app_images/app_images.dart';

class HomeDetailScreen extends StatefulWidget {
  final String name;
  final String id;
  final String time;

  const HomeDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.time,
  });

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "name": widget.name,
      "id": widget.id,
      "time": widget.time,
    };
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left, size: 24),
        ),
        title: Text(
          "home_detail.text1".tr(),
          style: AppStyles.medium16(AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Column(
          children: [
            _buildAppointmentCard(data),
            Container(
              width: 343.w,
              height: 198.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "home_detail.text2".tr(),
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(15.h),
                    _container(AppIcons.user, "home_detail.text3".tr(), "Someone"),
                    Gap(8.h),
                    _container(AppIcons.calendarr, "home_detail.text4".tr(), "21.22.1998"),
                    Gap(8.h),
                    _container(AppIcons.call, "home_detail.text5".tr(), "+998 91 234 56 78"),
                  ],
                ),
              ),
            ),
            Gap(12.h),
            Container(
              width: 343.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("home_detail.text6".tr(),style: AppStyles.medium16(AppColors.black),),
                    Gap(12.h),
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        dashPattern: [6, 4],
                        strokeWidth: 2,
                        radius: Radius.circular(16),
                        color: AppColors.grey,
                      ),
                      child: Container(
                        width: 319.w,
                        height: 160.h,
                        child: Center(
                          child: Container(
                            width: 100.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.red
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.upload),
                                Gap(2.w),
                                Text("home_detail.text7".tr(),style: AppStyles.medium16(AppColors.white),)
                              ],
                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 108.h,
        width: 375,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  _showExitDialog(context);
                },
                child: Container(
                  width: 174.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.grey
                  ),
                  child: Center(
                    child: Text("home_detail.text8".tr(),style: AppStyles.regular14(AppColors.red),),
                  ),
                ),
              ),
              Gap(6.w),
              Container(
                width: 174.5.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.primary
                ),
                child: Center(
                  child: Text("home_detail.text9".tr(),style: AppStyles.regular14(AppColors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, dynamic> data) {
    return InkWell(
      child: Container(
        width: 343.w,
        height: 73.h,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: AssetImage(AppImages.profile),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    style: AppStyles.medium16(AppColors.white),
                  ),
                  Text(
                    "ID: ${data["id"]}",
                    style: AppStyles.regular14(AppColors.grey),
                  ),
                ],
              ),
            ),
            Container(
              width: 109.w,
              height: 57.h,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.white.withOpacity(0.1)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, top: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.sp,
                          color: Colors.white70,
                        ),
                        Gap(4.w),
                        Text(
                          "TIME",
                          style: AppStyles.regular12(AppColors.white),
                        ),
                      ],
                    ),
                    Text(
                      data["time"],
                      style: AppStyles.medium16(AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _container (String icon, String title, String subtitle){
    return Container(
      width: 319.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.grey
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Gap(8.w),
            Text(title,style: AppStyles.regular14(AppColors.textGrey),),
            Spacer(),
            Text(subtitle,style: AppStyles.medium14(AppColors.black),),
          ],
        ),
      ),
    );
  }
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          title: Column(
            children: [
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.h),
                  child: SvgPicture.asset(AppIcons.error),
                ),
              ),
            ],
          ),
          content: Text(
            "home_detail.text10".tr(),
            textAlign: TextAlign.center,
            style: AppStyles.regular16(AppColors.black),
          ),
          actionsPadding: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // YO'Q TUGMASI
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 140.w, // Biroz qisqartirildi (sig'ishi uchun)
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.black.withOpacity(0.05), // Ko'rinadiganroq rang
                    ),
                    child: Center(
                      child: Text("home_detail.text11".tr(), style: AppStyles.medium14(AppColors.black)),
                    ),
                  ),
                ),
                Gap(10.w),
                // HA TUGMASI
                GestureDetector(
                  onTap: () {
                    // Bu yerga amalni bajaring
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 140.w, // Biroz qisqartirildi
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Text("home_detail.text12".tr(), style: AppStyles.medium14(AppColors.white)),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

}
