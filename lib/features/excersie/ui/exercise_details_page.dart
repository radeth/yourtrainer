import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yourtrainer/features/excersie/controller/exercise_controller.dart';
import 'package:yourtrainer/features/excersie/ui/delete_exercise_dialog.dart';
import 'package:yourtrainer/localization_ext.dart';
import 'package:yourtrainer/models/ModelProvider.dart';
import 'package:collection/collection.dart';

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
  
  //addExerciseStep(BuildContext context, WidgetRef ref, Exercise exercise) { ref.read(exerciseControllerProvider) }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseNameController =
        useTextEditingController(text: exercise.name);
    final exerciseDesciptionController =
        useTextEditingController(text: exercise.description);
    final exerciseSeriesNumberController =
        useTextEditingController(text: exercise.seriesNumber?.toString());
    final List<TextEditingController> exerciseStepsEditingControllers = [];

    //final tokensTextController = useTextEditingController( text: tokens.map((t) => tokenToString(t)).toList().join());

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: ListView(
        //mainAxisSize: MainAxisSize.min,
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
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.pop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteexercise(context, ref, exercise).then((value) {
                    if (value) {
                      context.pop();
                    }
                  });
                },
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
                    keyboardType: TextInputType.text,
                    controller: exerciseDesciptionController,
                    autofocus: true,
                    autocorrect: false,
                    decoration: const InputDecoration(),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: exerciseSeriesNumberController,
                    autofocus: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.reps),
                    textInputAction: TextInputAction.next,
                  ),
                  exerciseSteps(exercise, exerciseStepsEditingControllers,
                      DefaultTextStyle.of(context).style),
                  TextButton(
                      onPressed: () {
                      //setState(() { exercise.singleSeries?.add(ExerciseStep(tokens: [])); });
                      },
                      child: Text(AppLocalizations.of(context)!.addStep)),
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.saveExercise),
                      onPressed: () async {
                        final currentState = formGlobalKey.currentState;
                        if (currentState == null) {
                          return;
                        }
                        final tokenizedExerciseSteps =
                            exerciseStepsEditingControllers
                                .map((e) => ExerciseStep(
                                    tokens: tokenizeString(e.text)))
                                .toList();
                        if (currentState.validate()) {
                          final updatedExercise = exercise.copyWith(
                            name: exerciseNameController.text,
                            description: exerciseDesciptionController.text,
                            seriesNumber: int.tryParse(
                                exerciseSeriesNumberController.text),
                            singleSeries: tokenizedExerciseSteps,
                          );
                          AmplifyLogger().info("to save $updatedExercise");
                          ref
                              .read(exerciseControllerProvider)
                              .edit(updatedExercise);
                          context.pop();
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan tokenToWidget(ExerciseToken token) {
    var style = const TextStyle();
    switch (token.type) {
      case ExerciseTokenType.REP:
        style = const TextStyle(color: Colors.deepPurple);
        break;
      case ExerciseTokenType.WEIGTH:
        style = const TextStyle(color: Colors.deepOrange);
        break;
      case ExerciseTokenType.TIME:
        style = const TextStyle(color: Colors.blueGrey);
        break;
      case ExerciseTokenType.TEXT:
        break;
      case ExerciseTokenType.PAUSE:
        style = const TextStyle(color: Colors.blue);
        break;
    }

    return TextSpan(text: token.value, style: style);
  }

  String tokenToString(ExerciseToken token) {
    switch (token.type) {
      case ExerciseTokenType.REP:
        return ":R ${token.value ?? ""}:";
      case ExerciseTokenType.WEIGTH:
        return ":W ${token.value ?? ""}:";
      case ExerciseTokenType.TIME:
        return ":T ${token.value ?? ""}:";
      case ExerciseTokenType.TEXT:
        return token.value ?? "";
      case ExerciseTokenType.PAUSE:
        return ":P ${token.value ?? ""}:";
      default:
        return "";
    }
  }

  Widget exerciseSteps(
      Exercise exercise,
      List<TextEditingController> exerciseStepsEditingControllers,
      TextStyle style) {
    final stepList = exercise.singleSeries ?? [ExerciseStep(tokens: [])];

    List<Card> exerciseStepsList = [];

    for (int i = 0; i < stepList.length; i++) {
      final String tokensText =
          stepList[i].tokens!.map((t) => tokenToString(t)).toList().join();
      if (exerciseStepsEditingControllers.elementAtOrNull(i) == null) {
        exerciseStepsEditingControllers.add(useTextEditingController(
            text: tokensText)); // unobvious, but shuld work
      }
      exerciseStepsList.add(Card(
          elevation: 5,
          child: ExtendedTextField(
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(border: OutlineInputBorder()),
            specialTextSpanBuilder: ExerciseRegexSpecialTextSpanBuilder(),
            controller: exerciseStepsEditingControllers[i],
          )));
    }

/*
    return ListView(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shrinkWrap: true,
      children: exerciseStepsList,
    );
    */

    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        shrinkWrap: true,
        itemCount: exercise.singleSeries?.length ?? 1,
        itemBuilder: (BuildContext ctx, int index) {
          final stepList = exercise.singleSeries ?? [ExerciseStep(tokens: [])];
          final String tokensText = stepList[index]
              .tokens!
              .map((t) => tokenToString(t))
              .toList()
              .join();
          if (exerciseStepsEditingControllers.elementAtOrNull(index) == null) {
            exerciseStepsEditingControllers.insert(
                index,
                useTextEditingController(
                    text: tokensText)); // unobvious, but shuld work
          }
          return Card(
              elevation: 5,
              child: ExtendedTextField(
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                specialTextSpanBuilder: ExerciseRegexSpecialTextSpanBuilder(),
                controller: exerciseStepsEditingControllers[index],
              ));
        });
  }
  
}

class ExerciseRegexSpecialTextSpanBuilder extends RegExpSpecialTextSpanBuilder {
  final regexps = <TaggedRegExpSpecialText>[
    RegexRepsSpanBuilder(),
    RegexWeightSpanBuilder(),
    RegexTimeSpanBuilder(),
    RegexPauseSpanBuilder()
  ];

  @override
  List<RegExpSpecialText> get regExps => regexps;

  List<TaggedRegExpSpecialText> get tagged => regexps;
}

abstract class TaggedRegExpSpecialText extends RegExpSpecialText {
  String get displayPrefix;
  ExerciseTokenType get type;
  Color get bgColor;

  @override
  InlineSpan finishText(int start, Match match,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    textStyle = textStyle?.copyWith(backgroundColor: bgColor);

    final String value = '${match[0]}';
    //safePrint("vvv: ${value}");

    return SpecialTextSpan(
      text: "$displayPrefix${match[1]}", //value.replaceFirst(':R ', ':'),
      actualText: value,
      start: start,
      style: textStyle,
      recognizer: (TapGestureRecognizer()
        ..onTap = () {
          if (onTap != null) {
            onTap(value);
          }
        }),
      mouseCursor: SystemMouseCursors.text,
    );
  }
}

class RegexRepsSpanBuilder extends TaggedRegExpSpecialText {
  @override
  String get displayPrefix => "reps: ";

  @override
  RegExp get regExp => RegExp(r':R ([0-9]+):');

  @override
  ExerciseTokenType get type => ExerciseTokenType.REP;

  @override
  Color get bgColor => Colors.deepPurple.shade50;
}

class RegexWeightSpanBuilder extends TaggedRegExpSpecialText {
  @override
  String get displayPrefix => "weight: ";

  @override
  RegExp get regExp => RegExp(r":W ([0-9A-Za-z]+):");

  @override
  ExerciseTokenType get type => ExerciseTokenType.WEIGTH;

  @override
  Color get bgColor => Colors.deepOrange.shade50;
}

class RegexTimeSpanBuilder extends TaggedRegExpSpecialText {
  @override
  String get displayPrefix => "time: ";

  @override
  RegExp get regExp => RegExp(r":T ([0-9A-Za-z]+):");

  @override
  ExerciseTokenType get type => ExerciseTokenType.TIME;

  @override
  Color get bgColor => Colors.blueGrey.shade50;
}

class RegexPauseSpanBuilder extends TaggedRegExpSpecialText {
  @override
  String get displayPrefix => "pause: ";

  @override
  RegExp get regExp => RegExp(r":P ([0-9A-Za-z]+):");

  @override
  ExerciseTokenType get type => ExerciseTokenType.PAUSE;

  @override
  Color get bgColor => Colors.blue.shade50;
}
/*
class RepsTextSpanBuilder extends SpecialTextSpanBuilder {
  @override
  TextSpan build(String data,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    const repsPrefix = ":R";
    final splitData = data.split(" ");
    final spans = splitData.map((e) {
      if (e == repsPrefix) {
        return WidgetSpan(child: Chip(label: Text(e)));
      } else {
        return TextSpan(text: e);
      }
    }).toList();

    return TextSpan(children: spans, style: textStyle);
  }

  @override
  SpecialText? createSpecialText(String flag,
      {TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap,
      required int index}) {
    throw UnimplementedError();
  }
}
*/

List<T> flatten<T>(Iterable<Iterable<T>> nested) =>
    [for (var sublist in nested) ...sublist];

List<ExerciseToken> tokenizeString(String t) {
  final spans = flatten(ExerciseRegexSpecialTextSpanBuilder()
      .tagged
      .map((TaggedRegExpSpecialText regex) {
    return regex.regExp.allMatches(t).map((e) {
      return (e.start, e.end, regex.type, e.group(1));
    });
  }));

  final List<ExerciseToken> output = [];
  var pos = 0;
  var currentSpan = 0;
  while (pos < t.length) {
    if (currentSpan >= spans.length) {
      output.add(
          ExerciseToken(type: ExerciseTokenType.TEXT, value: t.substring(pos)));
      pos = t.length;
    } else if (pos < spans[currentSpan].$1) {
      final start = pos;
      final end = spans[currentSpan].$1;
      output.add(ExerciseToken(
          type: ExerciseTokenType.TEXT, value: t.substring(start, end)));

      pos = spans[currentSpan].$1;
    } else {
      final end = spans[currentSpan].$2;
      final type = spans[currentSpan].$3;
      final value = spans[currentSpan].$4;
      output.add(ExerciseToken(type: type, value: value));

      currentSpan++; // = current_span + 1;
      pos = end;
    }
  }

  AmplifyLogger().info("output $output");
  //safePrint("output: $output");

  return output; //[ExerciseToken(type: ExerciseTokenType.TEXT, value: t)];
}

class ExerciseStepsListWidget extends StatefulWidget {
  const ExerciseStepsListWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExerciseStepsListWidget();
  }

}

class _ExerciseStepsListWidget extends State<ExerciseStepsListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}