import 'package:ayol_uchun/data/models/accounts/social_media_accounts_model.dart';
import 'package:ayol_uchun/data/models/courses/courses_model.dart';
import 'package:ayol_uchun/data/models/interviews/interviews_model.dart';
import 'package:ayol_uchun/data/models/user_models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/categories/categories_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { error, loading, idle }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required List<CategoriesModel> categories,
    required List<CoursesModel> courses,
    required List<InterviewsModel> interviews,
    required List<SocialMediaAccountsModel> accounts,
    required UserModel? user,
    required HomeStatus status,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      courses: [],
      accounts: [],
      interviews: [],
      categories: [],
      user: UserModel.empty(), // ✅ safe default
      status: HomeStatus.loading,
    );
  }

}


