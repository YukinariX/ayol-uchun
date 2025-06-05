import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/core/routing/routes.dart';
import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:ayol_uchun/common/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/validator.dart';
import '../blocs/login_bloc/login_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "O‘quv platformasiga kirish uchun quyida "
            "berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Column(
            spacing: 8.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Ro'yxatdan otish",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              AppTextField(
                hintText: "Ism",
                controller: bloc.firstNameController,
                icon: Icon(Icons.person),
                validator: Validator.name,
              ),
              AppTextField(
                controller: bloc.lastNameController,
                hintText: "Familiya",
                icon: Icon(Icons.person),
                validator: Validator.name,
              ),
              AppTextField(
                controller: bloc.emailController,
                hintText: "Elektron pochta",
                icon: Icon(Icons.email),
                validator: Validator.email,
              ),
              SizedBox(height: 60.h),
              Container(
                width: 350.w,
                height: 95.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyishBlue),
                ),
                child: Column(
                  spacing: 16.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quyidagilar orqali o'tish",
                      style: TextStyle(
                        color: AppColors.primary400,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8.w,
                      children: [
                        AppButton(
                          callback: () {},
                          title: "Google",
                          color: Colors.white,
                          textColor: Colors.black,
                          icon: "assets/icons/google.svg",
                          width: 163.w,
                          height: 44.h,
                        ),
                        AppButton(
                          callback: () {},
                          title: "Apple",
                          color: Colors.white,
                          textColor: Colors.black,
                          icon: "assets/icons/apple.svg",
                          width: 163.w,
                          height: 44.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 84.h),
            ],
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(color: AppColors.primary200, fontSize: 14),
              children: [
                TextSpan(text: "Tizimga kirish orqali siz "),
                TextSpan(
                  text: "foydalanish shartlari",
                  style: TextStyle(color: AppColors.gradientEnd),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // open terms of use
                    },
                ),
                TextSpan(text: " va "),
                TextSpan(
                  text: "maxfiylik siyosati",
                  style: TextStyle(color: AppColors.gradientEnd),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // open privacy policy
                    },
                ),
                TextSpan(text: "ga roziligingizni tasdiqlaysiz"),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          AppButton(title: "Davom etish", callback: () {context.go(Routes.registerNum);}),
        ],
      ),
    );
  }
}
