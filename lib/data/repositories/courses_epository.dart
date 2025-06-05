import '../../core/client.dart';
import '../models/courses/courses_model.dart';

class CoursesRepository {
  final ApiClient client;

  CoursesRepository({required this.client});

  Future<List<CoursesModel>> fetchCourses({
    String? title,
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? orderBy,
  }) async {
    final rawCourses = await client.fetchCourses(queryParams: {
      "Title": title,
      "CategoryId": categoryId,
      "MinPrice": minPrice,
      "MaxPrice": maxPrice,
      "OrderBy": orderBy,
    });
    final courses = rawCourses.map((e) => CoursesModel.fromJson(e)).toList();
    print("repo:$courses");
    return courses;
  }
}
