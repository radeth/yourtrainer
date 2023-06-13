import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/Exercise.dart';
import '../services/exercises_datastore_service.dart';

final exercisesRepositoryProvider = Provider<ExercisesRepository>((ref) {
  ExercisesDataStoreService exercisesDataStoreService =
      ref.read(exercisesDataStoreServiceProvider);
  return ExercisesRepository(exercisesDataStoreService);
});

final exercisesListStreamProvider =
    StreamProvider.autoDispose<List<Exercise?>>((ref) {
  final exercisesRepository = ref.watch(exercisesRepositoryProvider);
  return exercisesRepository.getExercises();
});

final exerciseProvider =
    StreamProvider.autoDispose.family<Exercise?, String>((ref, id) {
  final exercisesRepository = ref.watch(exercisesRepositoryProvider);
  return exercisesRepository.get(id);
});

class ExercisesRepository {
  ExercisesRepository(this.exercisesDataStoreService);

  final ExercisesDataStoreService exercisesDataStoreService;

  Stream<List<Exercise>> getExercises() {
    return exercisesDataStoreService.listenToExercises();
  }

  Future<void> add(Exercise exercise) async {
    await exercisesDataStoreService.addExercise(exercise);
  }

  Future<void> update(Exercise updatedExercise) async {
    await exercisesDataStoreService.updateExercise(updatedExercise);
  }

  Future<void> delete(Exercise deletedExercise) async {
    await exercisesDataStoreService.deleteExercise(deletedExercise);
  }

  Stream<Exercise> get(String id) {
    return exercisesDataStoreService.getExerciseStream(id);
  }
}
