import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/common/widgets/app_text_field.dart';
import 'package:ayol_uchun/core/routing/routes.dart';
import 'package:ayol_uchun/core/validator.dart';
import 'package:ayol_uchun/features/authorization/blocs/login_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../blocs/login_bloc/login_bloc.dart';
import '../blocs/login_bloc/login_state.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "O‘quv platformasiga kirish uchun quyida berilgan maydonlarni to‘ldirib ro‘yxatdan o‘ting",
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
                "Ro'yxatdan o'tish",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              AppTextField(
                controller: bloc.passwordController,
                hintText: "Parol",
                icon: Icon(Icons.lock_open_outlined),
                validator: Validator.password,
              ),
              AppTextField(
                controller: bloc.passwordController,
                hintText: "Parolni tasdiqlash",
                icon: Icon(Icons.lock_open_outlined),
                validator: Validator.password,
              ),
              SizedBox(height: 300.h),
            ],
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.status == LoginStatus.success) {
                context.go(Routes.home);
              } else if (state.status == LoginStatus.error) {
                // Show error if you want
              }
            },
            child: AppButton(
              title: "Ro'yxatdan o'tish",
              callback: () {
                context.read<LoginBloc>().add(SignUpLoad());
              },
            ),
          )
        ],
      ),
    );
  }
}
