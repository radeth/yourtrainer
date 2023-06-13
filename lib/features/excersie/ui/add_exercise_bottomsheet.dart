import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/features/excersie/controller/exercise_list_controller.dart';
import 'package:yourtrainer/localization_ext.dart';

class AddExerciseBottomSheet extends HookConsumerWidget {
  AddExerciseBottomSheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseNameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Form(
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
                  hintText: AppLocalizations.of(context)!.exerciseNameHint),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: descriptionController,
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.next,
            ),
            TextButton(
                child: Text(AppLocalizations.of(context)!.saveExercise),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    ref.read(exercisesListControllerProvider).add(
                          name: exerciseNameController.text,
                          description: descriptionController.text,
                        );
                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
