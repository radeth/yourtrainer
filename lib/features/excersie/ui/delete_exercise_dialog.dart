import 'package:flutter/material.dart';
import 'package:yourtrainer/localization_ext.dart';

class DeleteExerciseDialog extends StatelessWidget {
  const DeleteExerciseDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.pleseConfirm),
      content: Text(AppLocalizations.of(context)!.exerciseDeleteConfirmation),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            child: Text(AppLocalizations.of(context)!.yes)),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(AppLocalizations.of(context)!.no),
        )
      ],
    );
  }
}
