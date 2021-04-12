import 'package:animals_app/business/i_category_manager.dart';
import 'package:animals_app/models/category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ICategoryManager _categoryManager;

  CategoryCubit(this._categoryManager) : super(CategoryInitial());

  getAll() async {
    emit(CategoryLoading());
    final categories = await _categoryManager.getAll();
    categories != null
        ? emit(CategoriesLoaded(categories))
        : emit(CategoryError("Kategoriler getirilemedi"));
  }
}
