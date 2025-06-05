import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../common/widgets/successfully_signed_up_dialog.dart';

class ValidateCodeView extends StatelessWidget {
  const ValidateCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "O‘quv platformasiga kirish uchun quyida telefon raqamingizga yuborilgan tasdiqlash kodini kiriting",
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
                "Tasdiqlash kodi",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Pinput(
                defaultPinTheme: PinTheme(
                  width: 50.w,
                  height: 49.h,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                    fontSize: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.1,
                        blurRadius: 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                length: 6,
                onCompleted: (pin) {},
                controller: controller,
              ),
              SizedBox(height: 300.h),
            ],
          ),
          AppButton(
            title: "Davom etish",
            callback: () { showDialog(
              context: context,
              builder: (context) => const SuccessfullySignUpDialog(),
            );
            },
          ),
        ],
      ),
    );
  }
}
