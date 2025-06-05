import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeCourseItem extends StatelessWidget {

  final String image,title,rating,user;
  const HomeCourseItem({super.key,required this.image,required this.title,required this.rating,required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 277.w,
          height: 281.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 1,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            image,
            width: 277.w,
            height: 147.h,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 10.w,
          bottom: 20.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/star.svg",
                    width: 14.w,
                    height: 14.h,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 50.h,
                width: 200.w,
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/user-three.svg",
                    width: 12,
                    height: 12,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    user,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  }
}
