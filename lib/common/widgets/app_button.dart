import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback callback;
  final double width, height;
  final String title, icon,icon2;
  final Color color,textColor;

  const AppButton({
    super.key,
    required this.callback,
    required this.title,
    this.color = AppColors.redPinkMain,
    this.icon = "",
    this.icon2 = "",
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon.isNotEmpty) ...[
          SvgPicture.asset(icon),
          SizedBox(width: 8), // spacing between icon and text
        ],
        Text(title),
        if (icon.isNotEmpty) ...[
          SvgPicture.asset(icon2),
          SizedBox(width: 8), // spacing between icon and text
        ],
      ],
    ),

    );
  }
}
