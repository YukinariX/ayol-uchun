import 'package:ayol_uchun/data/repositories/authorization_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../data/repositories/accounts_repository.dart';
import '../../../data/repositories/categories_repository.dart';
import '../../../data/repositories/courses_epository.dart';
import '../../../data/repositories/interviews_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesRepository _categoryRepo;
  final CoursesRepository _coursesRepo;
  final InterviewRepository _interviewsRepo;
  final AccountsRepository _accountsRepo;
  final AuthRepository _authRepo;

  HomeBloc({
    required CategoriesRepository categoryRepo,
    required CoursesRepository coursesRepo,
    required InterviewRepository interviewRepo,
    required AccountsRepository accountsRepo,
    required AuthRepository authRepo,
  }) : _categoryRepo = categoryRepo,
        _coursesRepo = coursesRepo,
        _accountsRepo = accountsRepo,
        _interviewsRepo = interviewRepo,
  _authRepo = authRepo,
        super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
  }

  Future<void> _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    final categories = await _categoryRepo.fetchCategories();
    emit(state.copyWith(status: HomeStatus.idle, categories: categories));

    final courses = await _coursesRepo.fetchCourses(
      title: event.title,
      categoryId: event.categoryId,
      minPrice: event.minPrice,
      maxPrice: event.maxPrice,
      orderBy: event.orderBy,
    );
    emit(state.copyWith(status: HomeStatus.idle, courses: courses));

    final interviews = await _interviewsRepo.fetchInterview();
    emit(state.copyWith(status: HomeStatus.idle, interviews: interviews));

    final accounts = await _accountsRepo.fetchAccounts();
    emit(state.copyWith(status: HomeStatus.idle, accounts: accounts));

    final user = await _authRepo.fetchUser();
    emit(state.copyWith(status: HomeStatus.idle, user: user));
  }
}