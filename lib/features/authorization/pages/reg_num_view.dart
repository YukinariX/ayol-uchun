import 'package:ayol_uchun/core/routing/routes.dart';
import 'package:ayol_uchun/core/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/app_text_field.dart';
import '../blocs/login_bloc/login_bloc.dart';

class RegNumView extends StatelessWidget {
  const RegNumView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "O‘quv platformasiga kirish uchun telefon raqamingizni kiriting",
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
                prefixText: "+998",
                controller: bloc.phoneNumberController,
                icon: Icon(Icons.phone),
                validator: Validator.phone,
                isDigitOnly: true,
              ),
              SizedBox(height: 350.h),
            ],
          ),
          SizedBox(height: 8.h,),
          AppButton(title: "Kodni yuborish", callback: (){context.push(Routes.validateCode);}),
        ],
      ),
    );
  }
}