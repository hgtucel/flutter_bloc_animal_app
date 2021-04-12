import 'package:animals_app/business/i_animal_manager.dart';
import 'package:animals_app/models/animal_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  final IAnimalManager _animalManager;
  AnimalCubit(this._animalManager) : super(AnimalInitial());

  getAll() async {
    emit(AnimalLoading());
    final animals = await _animalManager.getAll();
    animals != null
        ? emit(AnimalsLoaded(animals))
        : emit(AnimalError("Hayvanlar getirilemedi."));
  }
}
