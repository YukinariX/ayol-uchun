import 'package:ayol_uchun/common/pages/login_main_page.dart';
import 'package:ayol_uchun/common/pages/splash_screen.dart';
import 'package:ayol_uchun/core/routing/routes.dart';
import 'package:ayol_uchun/features/authorization/pages/login_view.dart';
import 'package:ayol_uchun/features/authorization/pages/reset_password_view.dart';
import 'package:ayol_uchun/features/home/blocs/home_event.dart';
import 'package:ayol_uchun/features/home/page/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/authorization/blocs/login_bloc/login_bloc.dart';
import '../../features/authorization/pages/reg_num_view.dart';
import '../../features/authorization/pages/register_view.dart';
import '../../features/authorization/pages/validate_code_view.dart';
import '../../features/courses/pages/courses_view.dart';
import '../../features/home/blocs/home_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.splashScreen,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => HomeBloc(
            accountsRepo: context.read(),
            authRepo: context.read(),
            categoryRepo: context.read(),
            coursesRepo: context.read(),
            interviewRepo: context.read(),
          )..add(HomeLoad()),
          child: child,
        );
      },
      routes: [
        GoRoute(path: Routes.home, builder: (context, state) => HomeView()),
        GoRoute(path: Routes.courses, builder: (context, state) => CoursesView()),
      ],
    ),
    GoRoute(
      path: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) => LoginBloc(repo: context.read()),
        child: LoginMainPage(child: child),
      ),
      routes: [
        GoRoute(path: Routes.login, builder: (context, state) => LoginView()),
        GoRoute(
          path: Routes.register,
          builder: (context, state) => RegisterView(),
        ),
        GoRoute(
          path: Routes.registerNum,
          builder: (context, state) => RegNumView(),
        ),
        GoRoute(
          path: Routes.validateCode,
          builder: (context, state) => ValidateCodeView(),
        ),
        GoRoute(
          path: Routes.resetPassword,
          builder: (context, state) => ResetPasswordView(),
        ),
      ],
    ),
  ],
);
