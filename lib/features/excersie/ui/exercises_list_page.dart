import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/data/exercises_repository.dart';
import 'package:yourtrainer/features/excersie/ui/add_exercise_bottomsheet.dart';
import 'package:yourtrainer/localization_ext.dart';
import 'package:yourtrainer/models/Exercise.dart';

class ExercisesListPage extends HookConsumerWidget {
  const ExercisesListPage({
    super.key,
  });

  void showAddExerciseDialog(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return AddExerciseBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final excersisesListValue = ref.watch(exercisesListStreamProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.yourExercises,
          ),
          leading: IconButton(
            onPressed: () {
              context.goNamed(AppRoute.home.name);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddExerciseDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        body: excersisesListValue.when(
            data: (exercises) => exercises.isEmpty
                ? const Center(
                    child: Text('No Exercises'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: exercises.map((exerciseData) {
                      return ExerciseListTitle(exercise: exerciseData!);
                    }).toList(),
                  ),
            error: (e, st) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}

class ExerciseListTitle extends StatelessWidget {
  const ExerciseListTitle({super.key, required this.exercise});
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(exercise.name),
          subtitle: Text(exercise.description!),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () =>
              context.pushNamed(AppRoute.exerciseDetails.name, pathParameters: {'id': exercise.id}, extra: exercise),
          leading: const Icon(Icons.sports_martial_arts)),
    );
  }
}
