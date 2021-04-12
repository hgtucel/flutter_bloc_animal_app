import 'package:animals_app/business/i_animal_manager.dart';
import 'package:animals_app/core/results/request_result.dart';
import 'package:animals_app/dataaccess/i_animal_dal.dart';
import 'package:animals_app/models/animal_model.dart';

class AnimalManager implements IAnimalManager {
  final IAnimalDal _animalDal;

  AnimalManager(this._animalDal);

  @override
  Future<List<AnimalModel>> getAll() async {
    final endpoint = Uri.https("xxxx.firebaseio.com", "/animals.json");
    final response = await _animalDal.getList(AnimalModel(), endpoint);
    if (response.status == Status.success) {
      return response.data;
    } else {
      throw "Veriler getirilemedi";
    }
  }
}
