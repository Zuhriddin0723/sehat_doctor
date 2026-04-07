import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_icons/app_icons.dart';
import 'package:sehat_doctor/src/app_theme/app_images/app_images.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';
import 'package:sehat_doctor/src/ui/main/patients/patients_information/patients_information.dart';
import 'package:sehat_doctor/src/widget/field_widget.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  List<dynamic> a = [
    {"img": AppImages.doctor, "name": "Michael Thompson", "id": "123445"},
    {"img": AppImages.profile, "name": "Ethan Carter", "id": "123446"},
    {"img": AppImages.profile, "name": "Lily Thompson", "id": "123443"},
    {"img": AppImages.profile, "name": "James Rodriguez", "id": "123447"},
    {"img": AppImages.profile, "name": "Sophia Lee", "id": "123448"},
    {"img": AppImages.profile, "name": "Aiden Smith", "id": "123449"},
    {"img": AppImages.profile, "name": "Olivia Brown", "id": "123450"},
    {"img": AppImages.profile, "name": "Olivia Brown", "id": "123451"},
    {"img": AppImages.profile, "name": "Lily Thompson", "id": "123452"},
  ];
  final TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "patients.text1".tr(),
          style: AppStyles.medium16(AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            FieldWidget(
              hintText: "patients.text2".tr(),
              controller: _controllerSearch,
              iconPath: AppIcons.search,
            ),
            Gap(10.h),
            Expanded(
              child: ListView.builder(
                itemCount: a.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => PatientsInformation(
                            id: a[index]["id"]!,
                            name: a[index]["name"],
                            img: a[index]["img"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 343.w,
                      height: 62.h,
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h, left: 10.w),
                        child: Row(
                          children: [
                            Container(
                              height: 44.h,
                              width: 44.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(44.r),
                              ),
                              child: Image.asset(
                                a[index]["img"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Gap(3.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  a[index]["name"],
                                  style: AppStyles.medium16(AppColors.black),
                                ),
                                Text(
                                  "ID: ${a[index]["id"]}",
                                  style: AppStyles.regular14(AppColors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
