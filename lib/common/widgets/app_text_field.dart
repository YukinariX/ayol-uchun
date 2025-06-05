import 'package:ayol_uchun/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final int? maxLength;
  final String? hintText;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isDigitOnly;
  final String? prefixText;

  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.icon,
    this.validator,
    this.isDigitOnly = false,
    this.prefixText,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon.icon, color: AppColors.primary400),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              maxLength: maxLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (_, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
              controller: controller,
              validator: validator,
              keyboardType:
              isDigitOnly ? TextInputType.phone : TextInputType.text,
              inputFormatters:
              isDigitOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
              decoration: InputDecoration(
                prefixText: prefixText,
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.primary400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
