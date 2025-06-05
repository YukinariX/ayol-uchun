import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InterviewItem extends StatelessWidget {

  final String image,title,duration,user;
  const InterviewItem({super.key,required this.image,required this.title,required this.duration,required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 228.w,
          height: 251.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 0.1,
                blurRadius: 1,
              ),
            ],
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              image,
              width: 228.w,
              height: 140.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 12.w,
          bottom: 16.h,
          child: Column(
            spacing: 7.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                    width: 12,
                    height: 12,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
                width: 200.w,
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
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
