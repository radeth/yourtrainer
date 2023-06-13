import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/Exercise.dart';

final exercisesDataStoreServiceProvider =
    Provider<ExercisesDataStoreService>((ref) {
  final service = ExercisesDataStoreService();
  return service;
});

class ExercisesDataStoreService {
  ExercisesDataStoreService();

  Stream<List<Exercise>> listenToExercises() {
    return Amplify.DataStore.observeQuery(
      Exercise.classType,
      sortBy: [Exercise.ID.ascending()],
    ).map((event) => event.items.toList()).handleError(
      (error) {
        debugPrint('listenToExercises: A Stream error happened');
      },
    );
  }

  Stream<Exercise> getExerciseStream(String id) {
    final exerciseStream = Amplify.DataStore.observeQuery(Exercise.classType,
            where: Exercise.ID.eq(id))
        .map((event) => event.items.toList().single);

    return exerciseStream;
  }

  Future<void> addExercise(Exercise exercise) async {
    try {
      await Amplify.DataStore.save(exercise);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deleteExercise(Exercise exercise) async {
    try {
      await Amplify.DataStore.delete(exercise);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updateExercise(Exercise updatedExercise) async {
    try {
      final exercisesWithId = await Amplify.DataStore.query(
        Exercise.classType,
        where: Exercise.ID.eq(updatedExercise.id),
      );

      final oldExercise = exercisesWithId.first;
      final newExercise = oldExercise.copyWith(
        name: updatedExercise.name,
        description: updatedExercise.description,
      );

      await Amplify.DataStore.save(newExercise);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
