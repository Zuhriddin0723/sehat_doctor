import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_doctor/src/ui/auth/login/login_screen.dart';
import 'package:sehat_doctor/src/ui/main/blog/blog_screen.dart';
import 'package:sehat_doctor/src/ui/main/bookings/bookings_screen.dart';
import 'package:sehat_doctor/src/ui/main/patients/patients_screen.dart';
import '../../app_theme/app_colors/app_colors.dart';
import '../../app_theme/app_icons/app_icons.dart';
import '../../app_theme/app_images/app_images.dart';
import '../../app_theme/app_styles/app_styles.dart';
import 'edit_profile/edit_profile_screen.dart';
import 'home/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    Builder(
      builder: (context) => HomePage(onTap: () {Scaffold.of(context).openDrawer();},),
    ),
    BookingsScreen(),
    PatientsScreen(),
    BlogScreen()
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
        child: ClipRRect( // 1. Blur chegaradan chiqib ketmasligi uchun
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9), // Xiralik darajasi
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                // 3. Rangni juda shaffof qilish kerak (0.1 - 0.3 atrofida)
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all( // 4. Glassmorphism effekti uchun ingichka chegara
                  color: Colors.white.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item(0, "main.text1".tr()),
                  _item(1, "main.text2".tr()),
                  _item(2, "main.text3".tr()),
                  _item(3, "main.text4".tr()),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        width: 320.w,
        backgroundColor: AppColors.white,
        child: Column(
          children: [
            Gap(52.h),
            Container(
              height: 96.h,
              width: 96.w,
              child: Image.asset(AppImages.doctor),
            ),
            Gap(8.h),
            Text("Dr. Emily Carter", style: AppStyles.medium16(AppColors.black)),
            Gap(4.h),
            Text("main.text5", style: AppStyles.regular14(AppColors.textGrey)),
            Gap(12.h),
            Container(
              width: 288.w,
              height: 192.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.shade100,
              ),
              child: Padding(
                padding: EdgeInsets.all(13.h),
                child: Column(
                  children: [
                    _drawer(AppIcons.user, "main.text6".tr(), false, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => EditProfile()),
                      );
                    }),
                    Gap(5.h),
                    Divider(color: Colors.grey.shade300),
                    Gap(5.h),
                    _drawer(AppIcons.language, "main.text7".tr(), true, () {}),
                    Gap(5.h),
                    Divider(color: Colors.grey.shade300),
                    Gap(5.h),
                    _drawer(AppIcons.support, "main.text8".tr(), false, () {}),
                    Gap(5.h),
                    Divider(color: Colors.grey.shade300),
                    Gap(5.h),
                    _drawer(
                      AppIcons.i,
                      "main.text9".tr(),
                      false,
                          () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.logout),
                  Gap(10.w),
                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      "main.text10".tr(),
                      style: AppStyles.regular16(AppColors.red),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "app_version".tr(),
                    style: AppStyles.regular14(AppColors.black),
                  ),
                  Spacer(),
                  Text("1.0.0", style: AppStyles.regular14(AppColors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(int index, String name) {
    final bool isActive = currentIndex == index;

    // Har bir index uchun qaysi ikonkani tanlash mantiqi
    String getIconPath() {
      switch (index) {
        case 0:
          return isActive ? AppIcons.active_home : AppIcons.home;
        case 1:
          return isActive ? AppIcons.active_booking : AppIcons.booking;
        case 2:
          return isActive ? AppIcons.active_user_multiple : AppIcons.user_multiple;
        case 3:
          return isActive ? AppIcons.active_calendar : AppIcons.calendar;
        default:
          return AppIcons.home;
      }
    }

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(getIconPath(), height: 24, width: 24),
            const SizedBox(height: 4),
            Text(
              name,
              style: AppStyles.regular14(isActive ? AppColors.primary : AppColors.textGrey)
            ),
          ],
        ),
      ),
    );
  }
  Widget _drawer(String icon, String name, bool a, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon, color: AppColors.black),
          Gap(12.w),
          Text(name, style: AppStyles.regular16(AppColors.black)),
          Spacer(),
          a ? SvgPicture.asset(AppIcons.chevron_down) : Text(""),
        ],
      ),
    );
  }

}
