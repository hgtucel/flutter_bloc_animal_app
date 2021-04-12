import 'package:animals_app/business/animal_manager.dart';
import 'package:animals_app/business/category_manager.dart';
import 'package:animals_app/business/i_animal_manager.dart';
import 'package:animals_app/business/i_category_manager.dart';
import 'package:animals_app/core/httpcore/http_core_request.dart';
import 'package:animals_app/core/i_request.dart';
import 'package:animals_app/dataaccess/httpcore/http_animal_dal.dart';
import 'package:animals_app/dataaccess/httpcore/http_category_dal.dart';
import 'package:animals_app/dataaccess/i_category_dal.dart';
import 'package:animals_app/ui/bloc/category/category_cubit.dart';
import 'package:animals_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dataaccess/i_animal_dal.dart';

class CompositionRoot {
  static Client _client;
  static IRequest _request;
  static IAnimalDal _animalDal;
  static ICategoryDal _categoryDal;
  static IAnimalManager _animalManager;
  static ICategoryManager _categoryManager;

  static configure() {
    _client = Client();
    _request = HttpCoreRequest(_client);
    _animalDal = HttpAnimalDal(_client);
    _categoryDal = HttpCategoryDal(_client);
    _animalManager = AnimalManager(_animalDal);
    _categoryManager = CategoryManager(_categoryDal);
  }

  static Widget composeHomeUI() {
    CategoryCubit categoryCubit = CategoryCubit(_categoryManager);
    return BlocProvider<CategoryCubit>(
      create: (BuildContext context) => categoryCubit,
      child: HomePage(),
    );
  }
}
