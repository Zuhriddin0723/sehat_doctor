import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_icons/app_icons.dart';
import 'package:sehat_doctor/src/app_theme/app_images/app_images.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';

import 'add_blog/add_blog_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<dynamic> a = [
    {
      "profile": AppImages.blog,
      "name": "Dr. Elena Rodriguez",
      "job": "Chief of Cardiology",
      "date": "12.03.2026",
      "title":
          "Advancements in Minimally Invasive Cardiac Surgery and Patient Outcomes",
      "subTitle": "The shift towards robotic- assisted techniques is…",
      "img": AppImages.monitor,
    },
    {
      "profile": AppImages.blog,
      "name": "Dr. Elena Rodriguez",
      "job": "Chief of Cardiology",
      "date": "12.03.2026",
      "title":
          "Advancements in Minimally Invasive Cardiac Surgery and Patient Outcomes",
      "subTitle": "The shift towards robotic- assisted techniques is…",
      "img": AppImages.monitor,
    },
    {
      "profile": AppImages.blog,
      "name": "Dr. Elena Rodriguez",
      "job": "Chief of Cardiology",
      "date": "12.03.2026",
      "title":
          "Advancements in Minimally Invasive Cardiac Surgery and Patient Outcomes",
      "subTitle": "The shift towards robotic- assisted techniques is…",
      "img": AppImages.flower,
    },
    {
      "profile": AppImages.blog,
      "name": "Dr. Elena Rodriguez",
      "job": "Chief of Cardiology",
      "date": "12.03.2026",
      "title":
          "Advancements in Minimally Invasive Cardiac Surgery and Patient Outcomes",
      "subTitle": "The shift towards robotic- assisted techniques is…",
      "img": AppImages.monitor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          "blog.text1".tr(),
          style: AppStyles.medium16(AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: a.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemBuilder: (context, index) {
                final item = a[index];
                return Container(
                  width: 355.w,
                  height: 227.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 48.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                item["profile"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Gap(12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["name"],
                                    style: AppStyles.medium16(AppColors.black),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    item["job"],
                                    style: AppStyles.regular14(
                                      AppColors.textGrey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),

                            /// more icon
                            PopupMenuButton<String>(
                              elevation: 0.50,
                              color: AppColors.white,
                              // Menyuning umumiy ko'rinishini sozlash
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              offset: const Offset(0, 40),
                              // Menyuni biroz pastroqdan chiqarish uchun
                              icon: const Icon(Icons.more_vert),

                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem<String>(
                                  value: 'share',
                                  child: SizedBox(
                                    width: 168.w,
                                    // MANA SHU YERDA O'ZINGIZGA KERAKLI WIDTH'NI BERASIZ
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.share),
                                        Gap(10.w),
                                        Text(
                                          "blog.text3".tr(),
                                          style: AppStyles.regular14(
                                            AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'edit',
                                  child: SizedBox(
                                    width: 168.w,
                                    // Ikkinchi elementga ham bir xil width bering
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.edit),
                                        Gap(10.w),
                                        Text(
                                          "blog.text2".tr(),
                                          style: AppStyles.regular14(
                                            AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["date"],
                                    style: AppStyles.regular12(
                                      AppColors.textGrey,
                                    ),
                                  ),
                                  Gap(10.h),
                                  Text(
                                    item["title"],
                                    style: AppStyles.bold16(AppColors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Gap(6.h),
                                  Text(
                                    item["subTitle"],
                                    style: AppStyles.regular14(
                                      AppColors.textGrey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Gap(12.w),
                            Padding(
                              padding: EdgeInsets.only(top: 23.h),
                              child: Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    item["img"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Gap(55.h),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 100.h),
        child: SizedBox(
          height: 60.h,
          width: 60.w,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => AddBlogScreen()),
              );
            },
            backgroundColor: const Color(0xFF0D2167),
            elevation: 4,
            shape: const CircleBorder(),
            child: Icon(Icons.add, color: Colors.white, size: 30.sp),
          ),
        ),
      ),
    );
  }
}
