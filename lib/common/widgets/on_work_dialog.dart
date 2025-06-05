import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
class OnWorkDialog extends StatelessWidget {
  const OnWorkDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Dialog(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        child: Container(
          width: 335.w,
          height: 265.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8,
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusGeometry.circular(15),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Image.asset("assets/icons/setting.png", width: 50),
                ),
              ),
              Text(
                "Bu sahifa jarayonda",
                style: TextStyle(
                  color: AppColors.primary900,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppButton(
                callback: () {
                  context.pop();
                },
                title: "Tushunarli",
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
