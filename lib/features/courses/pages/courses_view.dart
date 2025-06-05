import 'package:ayol_uchun/features/home/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../home/blocs/home_bloc.dart';
import '../../home/blocs/home_event.dart';
import '../../home/blocs/home_state.dart';
import '../../home/widgets/main_app_bar.dart';
import '../widgets/course_item.dart';
import '../widgets/course_item_shimmer.dart';
import '../widgets/filter_bottom_sheet.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.error:
            return Scaffold(body: Center(child: Text("Something went wrong")));
          case HomeStatus.loading:
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MainAppBar(title: "Kurslar 📚", icon: '', callback: () { },),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (_, __) => const CourseItemShimmer(),
              ),
            ),
            bottomNavigationBar: AppBottomNavigationBar(),
          );

          case HomeStatus.idle:
            if (state.courses.isEmpty) {
              return Scaffold(
                body: Center(child: Text("No courses available")),
              );
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: MainAppBar(
                title: "Kurslar 📚",
                icon: 'assets/icons/filter.svg',
                callback: () async {
                  final filters = await showModalBottomSheet<HomeLoad?>(
                    useSafeArea: true,
                    context: context,
                    builder: (context) => FilterBottomSheet(categories: state.categories),
                  );
                  if (filters != null) {
                    context.read<HomeBloc>().add(filters);
                  }
                },
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Kurslar ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          " (${state.courses.first.category ?? 'Unknown'})",
                          style: TextStyle(
                            color: AppColors.primary200,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          final course = state.courses[index];
                          return CourseItem(
                            user: course.user ?? 'Unknown',
                            title: course.title ?? 'No title',
                            category: course.category ?? 'Unknown',
                            image: course.image ?? '',
                            price: course.price ?? 0,
                            rating: course.rating ?? 0,
                            status: course.status ?? 'unknown',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: AppBottomNavigationBar(),
            );
        }
      },
    );
  }
}