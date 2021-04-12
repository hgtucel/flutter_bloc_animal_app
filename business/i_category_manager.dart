import 'package:animals_app/models/category_model.dart';

abstract class ICategoryManager {
  Future<List<CategoryModel>> getAll();
}
