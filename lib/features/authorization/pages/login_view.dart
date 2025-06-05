import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/common/widgets/app_text_field.dart';
import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:ayol_uchun/features/authorization/blocs/login_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../core/validator.dart';
import '../blocs/login_bloc/login_bloc.dart';
import '../blocs/login_bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool? phoneValid, passwordValid;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                "Kirish",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              AppTextField(
                prefixText: "+998",
                maxLength: 9,
                controller: context.read<LoginBloc>().phoneNumberController,
                icon: Icon(Icons.phone),
                validator: Validator.phone,
                isDigitOnly: true,
              ),
              AppTextField(
                controller: context.read<LoginBloc>().passwordController,
                hintText: "Parol",
                icon: const Icon(Icons.lock_open_outlined),
                validator: Validator.password,
              ),
              GestureDetector(
                onTap: () {
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Parolni unutdingizmi?",
                    style: TextStyle(color: AppColors.primary200, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(height: 120.h),
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
            ],
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state.status == LoginStatus.idle){
                context.go(Routes.home);
            }else{}},
            child: AppButton(
              title: "Kirish",
              callback: () {
                context.read<LoginBloc>().add(LoginLoad());
                context.read<LoginBloc>().phoneNumberController.text;
              },
            ),
          ),
          SizedBox(height: 8.h),
          AppButton(
            title: "Royxatdan otish",
            callback: () => context.push(Routes.register),
            color: AppColors.greyishBlue,
          ),
        ],
      ),
    );
  }
}
