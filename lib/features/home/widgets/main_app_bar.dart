import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import 'clipper.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String icon;
  final VoidCallback callback;
  final double height;

  MainAppBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.callback,
    this.height = 133,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return ClipPath(
      clipper: Clipper(),
      child: Container(
        color: AppColors.redPinkMain,
        height: height,
        padding: EdgeInsets.only(
          top: topPadding,
          left: 16,
          right: 16,
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(onPressed: callback, icon: SvgPicture.asset(icon)),
            ],
          ),
        ),
      ),
    );
  }
}