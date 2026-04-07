import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_doctor/src/app_theme/app_colors/app_colors.dart';
import 'package:sehat_doctor/src/app_theme/app_images/app_images.dart';
import 'package:sehat_doctor/src/app_theme/app_styles/app_styles.dart';
import 'package:sehat_doctor/src/ui/main/home/home_detail/home_detail_screen.dart';

// Eslatma: Sizdagi importlar o'z o'rnida qolsin, men ushbu kod ishlashi uchun ranglar va stillarni inline yozdim
class HomePage extends StatefulWidget {
  final VoidCallback onTap;
  const HomePage({super.key, required this.onTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ma'lumotlar strukturasini biroz boyitdik (Sarlavhalar uchun)
  List<Map<String, dynamic>> appointments = [
    {"type": "header", "title": "Today’s Appointments"},
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
    {"type": "header", "title": "Tomorrow"},
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
    {"type": "header", "title": "26 FEBRUARY"},
    {
      "img": AppImages.profile,
      "name": "Michael Thompson",
      "id": "123445",
      "time": "10:30 AM",
    },
  ];

  @override
  // HomePage build qismi shunday bo'lsin:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: myFixedAppBar(),
      body: ListView.builder(
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
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            );
          }
          return _buildAppointmentCard(item);
        },
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, dynamic> data) {
    bool isBlue = data["isBlue"] ?? false;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => HomeDetailScreen(
              id: data["id"],
              name: data["name"],
              time: data["time"],
            ),
          ),
        );
      },
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

  PreferredSizeWidget myFixedAppBar() {
    return AppBar(
      toolbarHeight: 90.h,
      backgroundColor: Color(0xFF001E62),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: widget.onTap,
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 21.r,
                backgroundImage: AssetImage(
                  "assets/images/doctor.png",
                ), // AppImages.doctor
              ),
            ),
          ),
          Gap(8.w),
          Text(
            "Dr. Emily Carter",
            style: AppStyles.medium20(AppColors.white)
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  height: 10.h,
                  width: 10.w,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
    );
  }
}
