import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class RatingAndStatus extends StatelessWidget {
  const RatingAndStatus({
    super.key,
    required this.rating,
    required this.category,
    required this.status,
  });

  final String rating, category, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 25.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/star.svg",
                width: 12.w,
                height: 12.h,
              ),
              SizedBox(width: 4.w),
              Text(
                softWrap: true,
                rating,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                category,
                style: TextStyle(
                  color: AppColors.primary200,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 100.w,
          height: 24.h,
          decoration: BoxDecoration(
            color: status == "Recommended"
                ? AppColors.greyishBlue
                : Colors.orange,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              status,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
