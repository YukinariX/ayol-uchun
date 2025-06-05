import 'package:ayol_uchun/features/courses/widgets/rating_and_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_widget_description.dart';

class CourseItem extends StatelessWidget {
  final String image, category, status, title, user;
  final num rating, price;

  const CourseItem({
    super.key,
    required this.image,
    required this.rating,
    required this.category,
    required this.status,
    required this.title,
    required this.user,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              children: [
                Image.network(
                  image,
                  width: double.infinity,
                  height: 164.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: RatingAndStatus(
                    rating: rating.toString(),
                    category: category,
                    status: status,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CourseWidgetDescription(
            title: title,
            user: user,
            price: price.toString(),
          ),
        ],
      ),
    );
  }
}