import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/colors.dart';
import '../../core/routing/routes.dart';

class SuccessfullySignUpDialog extends StatelessWidget {
  const SuccessfullySignUpDialog({super.key});

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
            spacing: 8,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusGeometry.circular(30),
                  border: Border.all(color: Colors.greenAccent),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/check.svg", width: 30),
                ),
              ),
              Text(
                "Muvaffaqiyatli tasdiqlandi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary900,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Telefon raqamingiz muvaffaqiyatli tasdiqlandi",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.primary500, fontSize: 13),
              ),
              AppButton(
                callback: () {
                  context.go(Routes.resetPassword);
                  context.pop();
                },
                title: "Tushunarli",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
