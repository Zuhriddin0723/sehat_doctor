import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';

import '../../../app_theme/app_images/app_images.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  List<Map<String, dynamic>> appointments = [
    {"type": "header", "title": "Today — FEB 21"},
    {
      "img": AppImages.profile,
      "name": "John Parker",
      "id": "123445",
      "time": "09:30 AM",
      "isBlue": true,
    },
    {
      "img": AppImages.profile,
      "name": "Michael Thompson",
      "id": "123445",
      "time": "10:30 AM",
    },
    {
      "img": AppImages.profile,
      "name": "Michael Thompson",
      "id": "123445",
      "time": "10:30 AM",
    },
    {"type": "header", "title": "Tomorrow — FEB 22 | Sunday"},
    {
      "img": AppImages.profile,
      "name": "Michael Thompson",
      "id": "123445",
      "time": "10:30 AM",
    },
    {
      "img": AppImages.profile,
      "name": "Sarah Johnson",
      "id": "123445",
      "time": "11:30 AM",
    },
    {"type": "header", "title": "FEB 23 | Monday"},
    {
      "img": AppImages.profile,
      "name": "Michael Thompson",
      "id": "123445",
      "time": "10:30 AM",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("bookings.text1".tr(),style: AppStyles.medium16(AppColors.black),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Gap(10.h),
          Container(
            height: 48.h,
            width: 355.w,
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [_tabItem("bookings.text2".tr(), 0), _tabItem("bookings.text3".tr(), 1)],
            ),
          ),
          Gap(10.h),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                /// upcoming
                ListView.builder(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 20.h,
                    bottom: 100.h,
                  ),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final item = appointments[index];
                    if (item.containsKey("type") && item["type"] == "header") {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 12.h,
                          top: index == 0 ? 0 : 16.h,
                        ),
                        child: Text(
                          item["title"],
                          style: AppStyles.regular14(AppColors.textGrey)
                        ),
                      );
                    }
                    return _buildAppointmentCard(item);
                  },
                ),
                /// History
                ListView.builder(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 20.h,
                    bottom: 100.h,
                  ),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final item = appointments[index];
                    if (item.containsKey("type") && item["type"] == "header") {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 12.h,
                          top: index == 0 ? 0 : 16.h,
                        ),
                        child: Text(
                          item["title"],
                          style: AppStyles.regular14(AppColors.textGrey)
                        ),
                      );
                    }
                    return _buildAppointmentCard(item);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _tabItem(String text, int index) {
    final isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey[200],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
                text,
                style: AppStyles.medium16(isActive ? Color(0xFF001E62) : Colors.black)
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildAppointmentCard(Map<String, dynamic> data) {
    bool isBlue = data["isBlue"] ?? false;
    return InkWell(
      onTap: () {},
      child: Container(
        width: 343.w,
        height: 73.h,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isBlue ? AppColors.primary : Colors.white,
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
                    style: AppStyles.medium16(
                      isBlue ? AppColors.white : AppColors.black,
                    ),
                  ),
                  Text(
                    "ID: ${data["id"]}",
                    style: AppStyles.regular14(
                      isBlue ? AppColors.grey : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 109.w,
              height: 57.h,
              decoration: BoxDecoration(
                color: isBlue
                    ? AppColors.white.withOpacity(0.1)
                    : Color(0xFFF0F4FF),
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isBlue
                      ? AppColors.white.withOpacity(0.1)
                      : AppColors.white.withOpacity(0.1),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.w, top: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.sp,
                          color: isBlue ? Colors.white70 : Color(0xFF001E62),
                        ),
                        Gap(4.w),
                        Text(
                          "TIME",
                          style: AppStyles.regular12(
                            isBlue ? AppColors.white : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      data["time"],
                      style: AppStyles.medium16(
                        isBlue ? AppColors.white : AppColors.primary,
                      ),
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

}
