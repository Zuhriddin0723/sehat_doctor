import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';

import '../../../../app_theme/app_icons/app_icons.dart';
import '../../../../app_theme/app_images/app_images.dart';

class PatientsInformation extends StatefulWidget {
  final String name;
  final String id;
  final String img;

  const PatientsInformation({
    super.key,
    required this.id,
    required this.name,
    required this.img,
  });

  @override
  State<PatientsInformation> createState() => _PatientsInformationState();
}

// Bu list API dan keladi deb hisoblaymiz
List<dynamic> a = [
  {"name": "Chest_Xray_Scan.jpg", "date": "21.22.2026", "mb": "4.5 MB"},
  {"name": "Abdominal_Ultrasound.jpg", "date": "22.22.2026", "mb": "12.2 MB"},
  {"name": "Blood_Test_Result.pdf", "date": "23.22.2026", "mb": "1.1 MB"},
  {"name": "MRI_Brain_Scan.jpg", "date": "24.22.2026", "mb": "45.0 MB"},
];

class _PatientsInformationState extends State<PatientsInformation> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "name": widget.name,
      "id": widget.id,
      "img": widget.img,
    };

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.chevron_left),
        ),
        title: Text(
          "patients_information.text1".tr(),
          style: AppStyles.medium16(AppColors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.background,
      // 1. BUTUN EKRAN SCROLL BO'LISHI UCHUN SingleChildScrollView
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          child: Column(
            children: [
              // Bemorning asosiy kartasi (ID va rasm)
              _buildAppointmentCard(data),
              Gap(10.h),

              // Bemor haqida batafsil ma'lumot (User, Date, Call)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "patients_information.text1".tr(),
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(15.h),
                    _infoRow(AppIcons.user, "patients_information.text2".tr(), "Someone"),
                    Gap(8.h),
                    _infoRow(AppIcons.calendarr, "patients_information.text3".tr(), "21.22.1998"),
                    Gap(8.h),
                    _infoRow(AppIcons.call, "patients_information.text4".tr(), "+998 91 234 56 78"),
                    Gap(8.h),
                    _infoRow(AppIcons.calendarr, "patients_information.text5".tr(), "21.22.2026"),
                  ],
                ),
              ),
              Gap(10.h),

              // 2. RASMLAR RO'YXATI (API UCHUN MOSLASHUVCHAN)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "patients_information.text6".tr(),
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(10.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Scrollni SingleChildScrollView boshqaradi
                      itemCount: a.length,
                      separatorBuilder: (context, index) => Gap(10.h),
                      itemBuilder: (context, index) {
                        return _buildFileItem(a[index]);
                      },
                    ),
                  ],
                ),
              ),
              Gap(20.h), // Pastki qismda bo'shliq
            ],
          ),
        ),
      ),
    );
  }

  // Fayllar (rasmlar) uchun alohida item widgeti
  Widget _buildFileItem(dynamic item) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1, color: AppColors.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.primary.withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.image_icon,
                colorFilter: const ColorFilter.mode(AppColors.primary, BoxFit.contain == true ? BlendMode.srcIn : BlendMode.srcIn),
              ),
            ),
          ),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["name"],
                  style: AppStyles.medium12(AppColors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item["mb"],
                  style: AppStyles.regular10(AppColors.textGrey),
                ),
              ],
            ),
          ),
          Text(
            item["date"],
            style: AppStyles.regular12(AppColors.textGrey),
          ),
        ],
      ),
    );
  }

  // Yuqoridagi Bemor kartasi
  Widget _buildAppointmentCard(Map<String, dynamic> data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: AssetImage(data["img"]),
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
                  style: AppStyles.regular14(AppColors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ma'lumotlar qatori (Icon + Title + Subtitle)
  Widget _infoRow(String icon, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.background, // Yoki AppColors.grey.withOpacity(0.1)
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
          Gap(8.w),
          Text(title, style: AppStyles.regular14(AppColors.textGrey)),
          const Spacer(),
          Text(subtitle, style: AppStyles.medium14(AppColors.black)),
        ],
      ),
    );
  }
}