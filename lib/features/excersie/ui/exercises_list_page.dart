import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/data/exercises_repository.dart';
import 'package:yourtrainer/features/excersie/ui/add_exercise_bottomsheet.dart';
import 'package:yourtrainer/features/excersie/ui/excercise_card.dart';
import 'package:yourtrainer/localization_ext.dart';

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
    final Orientation orientation = MediaQuery.of(context).orientation;
    final excersisesListValue = ref.watch(exercisesListStreamProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.yourExercises,
          ),
          // leading: IconButton(
          //   onPressed: () {
          //     context.goNamed(AppRoute.home.name);
          //   },
          //   icon: const Icon(Icons.arrow_back),
          // ),
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
                    children: [
                      Flexible(
                        child: GridView.count(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.all(4),
                          childAspectRatio:
                              (orientation == Orientation.portrait) ? 0.9 : 1.4,
                          children: exercises.map((exerciseData) {
                            return ExerciseCard(exercise: exerciseData!);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
