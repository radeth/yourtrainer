import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/features/excersie/data/exercises_repository.dart';
import 'package:yourtrainer/models/Exercise.dart';

final exerciseControllerProvider = Provider<ExerciseController>((ref) {
  return ExerciseController(ref);
});

class ExerciseController {
  ExerciseController(this.ref);
  final Ref ref;
  Future<void> edit(Exercise updatedExercise) async {
    final exercisesRepository = ref.read(exercisesRepositoryProvider);
    await exercisesRepository.update(updatedExercise);
  }

  Future<void> delete(Exercise deletedExercise) async {
    final exercisesRepository = ref.read(exercisesRepositoryProvider);
    await exercisesRepository.delete(deletedExercise);
  }
}
