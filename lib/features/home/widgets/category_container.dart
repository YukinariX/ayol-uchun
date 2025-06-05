import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/data/models/categories/categories_model.dart';
import 'package:ayol_uchun/features/home/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class CategoryContainer extends StatefulWidget {

final List<CategoriesModel> category;

  const CategoryContainer({super.key,required this.category});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.pinkSub),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "KATEGORIYALAR",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? 350.h : 258.h,
            child: GridView.builder(
              itemCount: widget.category.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 16.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 160.w / 50.h,
              ),
              itemBuilder: (context, index) => CategoryItem(
                courses: widget.category[index].totalCourses,
                title: widget.category[index].title,
                image: widget.category[index].icon,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          AppButton(
            callback: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            title: isExpanded ? "Yopish" : "Barcha kategoriyalar",
            icon2: "assets/icons/arrow-right.svg",
          ),
        ],
      ),
    );
  }
}
