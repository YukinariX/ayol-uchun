import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';

class CategoryFilterItem extends StatelessWidget {
  final int courses;
  final String title, image;
  final bool isSelected;

  const CategoryFilterItem({
    super.key,
    required this.courses,
    required this.title,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.redPinkMain.withOpacity(0.1) : Colors.white,
        border: Border.all(
          color: isSelected
              ? AppColors.redPinkMain
              : AppColors.redPinkMain.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            isSelected ? "assets/icons/On.svg" : "assets/icons/off.svg",
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
          Transform.rotate(
            angle: -6.2,
            child: Image.network(
              image,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
