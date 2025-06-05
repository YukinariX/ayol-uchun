import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AdvertisementContainer extends StatelessWidget {
  const AdvertisementContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          "assets/images/background-image.png",
          width: double.infinity,
          height: 300.h,
        ),
        Positioned(
          top: 16.h,
          left: 26.w,
          child: Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 253.h,
                height: 60.h,
                child: Text(
                  softWrap: true,
                  "👋🏻 Hey, Siz ham ayollar uchun foydali videolar tayyorlay"
                      " olasizmi?Unda jamoamizga qo‘shiling!",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              AppButton(callback: (){}, title: "Qoshilish",color: Colors.white,textColor: AppColors.redPinkMain,)
            ],
          ),
        ),
        Positioned(
            bottom: 30,
            right: 18,
            child: Image.asset("assets/images/woman.png", fit: BoxFit.cover,))
      ],
    );
  }
}