import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:oop_electronic_voting/data/models/dtos/candidate/candidate_dto.dart';
import 'package:oop_electronic_voting/data/models/dtos/election/election_dto.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/create_candidate_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/create_election_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';

import '../../../data/repositories/contracts/candidate/candidate.dart';
import '../common/widgets/outlined_container.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController candidateColourController = TextEditingController();

  @override
  void initState() {
    super.initState();

    CreateElectionCubit createElectionCubit =
        context.read<CreateElectionCubit>();
    createElectionCubit.getCandidates();

    ElectionsCubit electionsCubit = context.read<ElectionsCubit>();
    electionsCubit.getElections();
  }

  @override
  Widget build(BuildContext context) {
    CreateElectionCubit createElectionCubit =
        context.watch<CreateElectionCubit>();

    CreateCandidateCubit createCandidateCubit =
        context.watch<CreateCandidateCubit>();

    List<ElectionDto> completedElections = context
        .watch<ElectionsCubit>()
        .state
        .where((e) => e.endTime.isBefore(DateTime.now()))
        .toList();

    // TODO probably should display these so you know when one is successfully created
    List<ElectionDto> activeElections = context
        .watch<ElectionsCubit>()
        .state
        .where((e) => !completedElections.contains(e))
        .toList();

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
                        onPressed: () async =>
                            await createElectionCubit.createElection(),
                        child: const Text("Create Election"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 30,
                    children: [
                      const Text("Create a New Candidate:"),
                      TextField(
                        decoration: const InputDecoration(labelText: "Name"),
                        onChanged: (value) =>
                            createCandidateCubit.setName(value),
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: "Image URL"),
                        onChanged: (value) =>
                            createCandidateCubit.setImageUrl(value),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Colour",
                          suffixIcon: GestureDetector(
                            onTap: () => _colourPicker(
                                context,
                                candidateColourController,
                                createCandidateCubit),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: createCandidateCubit.getColour(),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        controller: candidateColourController,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async => await createCandidateCubit.createCandidate(),
                        child: const Text("Create Candidate"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // const Text("Election Results:"),
                  // for (ElectionDto election in activeElections)
                  //   ElectionResultPercentage(election),
                  for (ElectionDto election in completedElections)
                    ElectionResultPercentage(election),
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
          },
        ),
        CircleAvatar(backgroundImage: NetworkImage(candidateMap.key.imageUrl)),
        const SizedBox(width: 10),
        Text(candidateMap.key.name),
      ],
    );
  }
}

class ElectionResultPercentage extends StatelessWidget {
  final ElectionDto election;

  const ElectionResultPercentage(
    this.election, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final highestVoteCount = election.candidates
        .fold<int>(0, (max, obj) => obj.voteCount > max ? obj.voteCount : max);

    final totalVotes =
        election.candidates.fold(0, (sum, item) => sum + item.voteCount);

    return OutlinedColumn(
      maxWidth: 600,
      borderRadius: 20,
      innerPadding: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(election.name),
            const SizedBox(width: 10),
            DataTable(
              border: TableBorder(
                  left: BorderSide(
                      color: theme.colorScheme.outlineVariant, width: 1)),
              columns: [
                for (CandidateDto candidate in election.candidates)
                  DataColumn(
                    label: Text(
                      candidate.name,
                      style: candidate.voteCount == highestVoteCount
                          ? const TextStyle(color: Colors.green)
                          : null,
                    ),
                  ),
              ],
              rows: [
                DataRow(
                  cells: [
                    for (CandidateDto candidate in election.candidates)
                      DataCell(Text(
                          "${(candidate.voteCount / totalVotes).toStringAsFixed(1)}%")),
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

Future<void> _colourPicker(
    BuildContext context,
    TextEditingController controller,
    CreateCandidateCubit createCandidateCubit) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: createCandidateCubit.getColour(),
            onColorChanged: (value) {
              var colour = '${value.red.toRadixString(16).padLeft(2, '0')}'
                  '${value.green.toRadixString(16).padLeft(2, '0')}'
                  '${value.blue.toRadixString(16).padLeft(2, '0')}';

              controller.text = colour;
            },
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Select'),
            onPressed: () {
              createCandidateCubit.setColour(controller.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
