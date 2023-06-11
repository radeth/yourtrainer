import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/excersie/controller/exercise_list_controller.dart';

class AddExerciseBottomSheet extends HookConsumerWidget {
  AddExerciseBottomSheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripNameController = useTextEditingController();
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
              controller: tripNameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                const validationError = 'Enter a valid exercise name';
                if (value == null || value.isEmpty) {
                  return validationError;
                }

                return null;
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Exercise Name"),
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
              decoration:
                  const InputDecoration(hintText: "Exercise Description"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid description';
                }
              },
            ),
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    ref.read(exercisesListControllerProvider).add(
                          name: tripNameController.text,
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
