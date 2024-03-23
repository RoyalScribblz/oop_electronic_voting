import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/create_election_cubit.dart';

import '../../../data/repositories/contracts/candidate/candidate.dart';
import '../common/widgets/outlined_container.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    super.initState();

    CreateElectionCubit createElectionCubit =
        context.read<CreateElectionCubit>();
    createElectionCubit.getCandidates();
  }

  @override
  Widget build(BuildContext context) {
    CreateElectionCubit createElectionCubit =
        context.watch<CreateElectionCubit>();

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 30,
                    children: [
                      const Text("Create a New Election:"),
                      TextField(
                        decoration: const InputDecoration(labelText: "Name"),
                        onChanged: (value) =>
                            createElectionCubit.updateName(value),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: "Start Time"),
                        onChanged: (value) =>
                            createElectionCubit.updateStartTime(value),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: "End Time"),
                        onChanged: (value) =>
                            createElectionCubit.updateEndTime(value),
                      ),
                      for (MapEntry<Candidate, bool> candidateMap
                          in createElectionCubit.state.candidates.entries)
                        CandidateSelector(candidateMap, createElectionCubit),
                      ElevatedButton(
                        onPressed: () async => await createElectionCubit.createElection(),
                        child: const Text("Create Election"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  Text("Election Results:"),
                  ElectionResultPercentage(),
                  SizedBox(height: 10),
                  ElectionResultPercentage(),
                  SizedBox(height: 10),
                  ElectionResultPercentage(),
                  SizedBox(height: 10),
                  ElectionResultPercentage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CandidateSelector extends StatelessWidget {
  final MapEntry<Candidate, bool> candidateMap;
  final CreateElectionCubit createElectionCubit;

  const CandidateSelector(
    this.candidateMap,
    this.createElectionCubit, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: candidateMap.value,
            onChanged: (value) {
              if (value == null) {
                return;
              }

              createElectionCubit.toggleCandidate(candidateMap.key, value);
            }),
        // TODO create candidate
        // const SizedBox(width: 10),
        // GestureDetector(
        //   onTap: () => _colourPicker(context),
        //   child: Container(
        //     width: 20,
        //     height: 20,
        //     decoration: BoxDecoration(
        //         color: Colors.primaries[Random()
        //             .nextInt(Colors.primaries.length)],
        //         shape: BoxShape.circle,
        //         border: Border.all(color: Colors.white)),
        //   ),
        // ),
        const SizedBox(width: 10),
        Text(candidateMap.key.name),
      ],
    );
  }
}

class ElectionResultPercentage extends StatelessWidget {
  const ElectionResultPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return OutlinedColumn(
      maxWidth: 600,
      borderRadius: 20,
      innerPadding: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Cool Election"),
            const SizedBox(width: 10),
            DataTable(
              border: TableBorder(
                  left: BorderSide(
                      color: theme.colorScheme.outlineVariant, width: 1)),
              columns: const [
                DataColumn(label: Text("James")),
                DataColumn(
                    label: Text(
                  "Moe",
                  style: TextStyle(color: Colors.green),
                )),
                DataColumn(label: Text("Freddie")),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text("12%")),
                    DataCell(Text("73%")),
                    DataCell(Text("15%")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> _colourPicker(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: Colors.red,
            onColorChanged: (_) => {},
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Select'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
