import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoCourseYet extends StatelessWidget {

  final VoidCallback callback;
  const NoCourseYet({super.key,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 335.w,
      height: 230.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: AppColors.primary200, blurRadius: 5)],
      ),
      child: Column(
        spacing: 10.h,
        children: [
          Image.asset("assets/images/logo.png"),
          Text(
            textAlign: TextAlign.center,
            "Sizda hali boshlangan kurs mavjud emas. Ko‘plab"
            " foydali kurslarimiz orasidan bittasini tanlang.",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          AppButton(
            callback: () {},
            title: "Kurs sotib olish",
            width: 150.w,
            height: 34.h,
          ),
        ],
      ),
    );
  }
}
