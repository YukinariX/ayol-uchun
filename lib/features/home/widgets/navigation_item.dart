import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.callback,
    required this.isSelected,
  });

  final String icon, title;
  final VoidCallback callback;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.redPinkMain : AppColors.primary200;

    return Column(
      children: [
        InkWell(
          onTap: callback,
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
