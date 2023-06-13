import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:yourtrainer/common/routes.dart';
import 'package:yourtrainer/models/Exercise.dart';
import 'package:yourtrainer/common/colors.dart' as constants;

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    required this.exercise,
    this.imageURL,
    super.key,
  });

  final Exercise exercise;
  final String? imageURL;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5.0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 500,
                  alignment: Alignment.center,
                  color: const Color(constants.primaryColorDark),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(AppRoute.exerciseDetails.name,
                                  pathParameters: {'id': exercise.id},
                                  extra: exercise);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            exercise.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
