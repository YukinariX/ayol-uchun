import '../../core/client.dart';
import '../models/categories/categories_model.dart';

class CategoriesRepository {
  final ApiClient client;

  CategoriesRepository({required this.client});

  Future<List<CategoriesModel>> fetchCategories() async {
    final rawCategories = await client.fetchCategories();
    final categories = rawCategories.map((e) => CategoriesModel.fromJson(e)).toList();
    print("repo:$categories");
    return categories;
  }
}