import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/features/excersie/controller/exercise_controller.dart';
import 'package:yourtrainer/features/excersie/ui/delete_exercise_dialog.dart';
import 'package:yourtrainer/localization_ext.dart';
import 'package:yourtrainer/models/Exercise.dart';
import 'package:yourtrainer/common/colors.dart' as constants;

class ExerciseDetailsPage extends HookConsumerWidget {
  ExerciseDetailsPage({
    required this.exercise,
    super.key,
  });

  final Exercise exercise;
  final formGlobalKey = GlobalKey<FormState>();

  Future<bool> deleteexercise(
      BuildContext context, WidgetRef ref, Exercise exercise) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return const DeleteExerciseDialog();
        });
    value ??= false;

    if (value) {
      await ref.read(exerciseControllerProvider).delete(exercise);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseNameController =
        useTextEditingController(text: exercise.name);
    final exerciseDesciptionController =
        useTextEditingController(text: exercise.description);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            exercise.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(AppRoute.home.name);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {
                  deleteexercise(context, ref, exercise).then((value) {
                    if (value) {
                      context.goNamed(
                        AppRoute.home.name,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          Form(
            key: formGlobalKey,
            child: Container(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    //initialValue: trip.tripName,
                    controller: exerciseNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      var validationError = AppLocalizations.of(context)!
                          .exerciseNameValidationErrorMessage;
                      if (value == null || value.isEmpty) {
                        return validationError;
                      }

                      return null;
                    },
                    autofocus: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.exerciseNameHint),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    //initialValue: trip.destination,
                    keyboardType: TextInputType.name,
                    controller: exerciseDesciptionController,
                    autofocus: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .exerciseDescriptionHint),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.saveExercise),
                      onPressed: () async {
                        final currentState = formGlobalKey.currentState;
                        if (currentState == null) {
                          return;
                        }
                        if (currentState.validate()) {
                          final updatedExercise = exercise.copyWith(
                            name: exerciseNameController.text,
                            description: exerciseDesciptionController.text,
                          );
                          ref
                              .read(exerciseControllerProvider)
                              .edit(updatedExercise);
                          context.goNamed(
                            AppRoute.home.name,
                          );
                        }
                      } //,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
