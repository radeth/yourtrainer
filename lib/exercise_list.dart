import 'package:flutter/material.dart';
import 'package:yourtrainer/add_excersise.dart';

class ExerciseList extends StatefulWidget {
  const ExerciseList({super.key});

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        const Text("Exercise List"),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const AddExcersicePage();
            }));
          },
          child: null,
        )
      ],
    ));
  }
}
