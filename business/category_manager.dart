import 'package:animals_app/business/i_category_manager.dart';
import 'package:animals_app/core/results/request_result.dart';
import 'package:animals_app/dataaccess/i_category_dal.dart';
import 'package:animals_app/models/category_model.dart';

class CategoryManager implements ICategoryManager {
  final ICategoryDal _categoryDal;

  CategoryManager(this._categoryDal);

  @override
  Future<List<CategoryModel>> getAll() async {
    final endpoint = Uri.https("xxxx.firebaseio.com", "/categories.json");
    final response = await _categoryDal.getList(CategoryModel(), endpoint);
    if (response.status == Status.success) {
      return response.data;
    } else {
      throw "Veriler getirilemedi";
    }
  }
}
