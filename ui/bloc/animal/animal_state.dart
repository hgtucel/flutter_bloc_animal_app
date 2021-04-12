part of 'animal_cubit.dart';

@immutable
abstract class AnimalState {}

class AnimalInitial extends AnimalState {}

class AnimalLoading extends AnimalState {}

class AnimalsLoaded extends AnimalState {
  final List<AnimalModel> animals;
  AnimalsLoaded(this.animals);
}

class AnimalError extends AnimalState {
  final String message;
  AnimalError(this.message);
}
