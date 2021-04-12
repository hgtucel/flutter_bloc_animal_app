import 'package:animals_app/models/animal_model.dart';

abstract class IAnimalManager {
  Future<List<AnimalModel>> getAll();
}
