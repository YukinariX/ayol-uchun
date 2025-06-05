import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/on_work_dialog.dart';
import '../../../core/routing/routes.dart';
import 'navigation_item.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      width: double.infinity,
      height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationItem(
            icon: "assets/icons/home.svg",
            title: "Asosiy",
            isSelected: location == Routes.home,
            callback: () => context.go(Routes.home),
          ),
          NavigationItem(
            icon: "assets/icons/courses.svg",
            title: "Kurslar",
            isSelected: location == Routes.courses,
            callback: () => context.push(Routes.courses)
          ),
          NavigationItem(
            icon: "assets/icons/blog.svg",
            title: "Blog",
            isSelected: false,
            callback: () => showDialog(
              context: context,
              builder: (context) => const OnWorkDialog(),
            )
          ),
          NavigationItem(
            icon: "assets/icons/user-two.svg",
            title: "Kabinet",
            isSelected: false,
            callback: () => showDialog(
              context: context,
              builder: (context) => const OnWorkDialog(),
            )),
        ],
      ),
    );
  }
}