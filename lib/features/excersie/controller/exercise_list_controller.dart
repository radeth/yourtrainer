import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yourtrainer/features/excersie/data/exercises_repository.dart';
import 'package:yourtrainer/models/ModelProvider.dart';

final exercisesListControllerProvider =
    Provider<ExcersisesListController>((ref) {
  return ExcersisesListController(ref);
});

class ExcersisesListController {
  ExcersisesListController(this.ref);
  final Ref ref;

  Future<void> add({
    required String name,
    required String description,
  }) async {
    Exercise exercise = Exercise(
      name: name,
      description: description,
    );

    final exercisesRepository = ref.read(exercisesRepositoryProvider);

    await exercisesRepository.add(exercise);
  }
}
