import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:ayol_uchun/features/home/widgets/interview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/on_work_dialog.dart';
import '../../../data/models/interviews/interviews_model.dart';

class InterviewsRow extends StatelessWidget {
  const InterviewsRow({super.key, required this.interviews});

  final List<InterviewsModel> interviews;

  String formatDuration(int totalMinutes) {
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    return '$hours soat, $minutes daqiqa';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INTERVYULAR",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 20.w,
            children: List.generate(interviews.length, (index) {
              return InterviewItem(
                image: interviews[index].image,
                title: interviews[index].title,
                duration: formatDuration(interviews[index].duration),
                user: interviews[index].user,
              );
            }),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const OnWorkDialog(),
            );
          },
          child: SizedBox(
            height: 20.h,
            child: Row(
              children: [
                Text(
                  "Barcha intervyular",
                  style: TextStyle(
                    color: AppColors.primary200,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5.h),
                SvgPicture.asset(
                  "assets/icons/arrow-right.svg",
                  width: 20.w,
                  height: 20.h,
                  color: AppColors.primary200,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
