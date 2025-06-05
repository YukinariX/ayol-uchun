import 'package:ayol_uchun/features/home/widgets/advertisement_container.dart';
import 'package:ayol_uchun/features/home/widgets/app_bottom_navigation_bar.dart';
import 'package:ayol_uchun/features/home/widgets/home_course_item.dart';
import 'package:ayol_uchun/features/home/widgets/no_course_yet.dart';
import 'package:ayol_uchun/features/home/widgets/social_media_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/home_bloc.dart';
import '../blocs/home_state.dart';
import '../widgets/category_container.dart';
import '../widgets/interviews_row.dart';
import '../widgets/main_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.error:
            return Scaffold(body: Center(child: Text("Something went wrong")));
          case HomeStatus.loading:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeStatus.idle:
            return Scaffold(
              backgroundColor: Color(0xFFFAFBFC),
              appBar: MainAppBar(
                title: 'Salom, ${state.user!.firstName}!',
                icon: 'assets/icons/bell.svg',
                callback: () {},
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: state.courses.isEmpty
                          ? NoCourseYet(callback: () {})
                          : HomeCourseItem(
                        image: state.courses[0].image!,
                        title: state.courses[0].title!,
                        rating: state.courses[0].rating.toString(),
                        user: state.courses[0].user!,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CategoryContainer(category: state.categories),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SocialMediaContainer(accounts: state.accounts),
                          SizedBox(height: 24.h),
                          InterviewsRow(interviews: state.interviews),
                          SizedBox(height: 24.h),
                          AdvertisementContainer(),
                        ],
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
