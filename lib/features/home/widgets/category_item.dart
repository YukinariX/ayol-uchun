import 'package:ayol_uchun/common/widgets/on_work_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class CategoryItem extends StatelessWidget {
  final int courses;
  final String title, image;
  const CategoryItem({
    super.key,
    required this.courses,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) => const OnWorkDialog(),
        );
      },
      child: Container(
        width: 160.w,
        height: 60.h,
        padding: EdgeInsets.only(left: 8.w, top: 5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.redPinkMain.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
                Text(
                  "Jami ${courses}ta dars",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.rotate(
                angle: -6.2,
                child: Image.network(image, width: 50.w, height: 50.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
