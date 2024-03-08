import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oop_electronic_voting/extensions/datetime_extensions.dart';
import 'package:oop_electronic_voting/extensions/list_extensions.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/user_cubit.dart';
import 'package:oop_electronic_voting/presentation/pages/vote_page/vote_page.dart';

import '../../../data/models/dtos/candidate/candidate_dto.dart';
import '../../../data/models/dtos/election/election_dto.dart';
import '../../../data/models/dtos/voter/voter_dto.dart';
import '../../controllers/cubits/vote_page_cubit.dart';

class VoterHomePage extends StatefulWidget {
  const VoterHomePage({super.key});

  @override
  State<VoterHomePage> createState() => _VoterHomePageState();
}

class _VoterHomePageState extends State<VoterHomePage> {
  @override
  void initState() {
    super.initState();

    ElectionsCubit electionsCubit = context.read<ElectionsCubit>();
    electionsCubit.getElections();
  }

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.watch<UserCubit>();

    List<ElectionDto> completedElections = context
        .watch<ElectionsCubit>()
        .state
        .where((e) => e.endTime.isBefore(DateTime.now()))
        .toList();

    List<ElectionDto> activeElections = context
        .watch<ElectionsCubit>()
        .state
        .where((e) => !completedElections.contains(e))
        .toList();

    completedElections.sort((a, b) => a.endTime.compareTo(b.endTime));
    activeElections.sort((a, b) => a.endTime.compareTo(b.endTime));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome ${userCubit.state.voter!.firstName}, you may vote in the following elections:",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            for (ElectionDto election in activeElections)
              ElectionPreview(election, userCubit.state.voter!),
            const Text("Finished Elections:", style: TextStyle(fontSize: 20)),
            for (ElectionDto election in completedElections)
              ElectionPreview(election, userCubit.state.voter!),
          ],
        ),
      ),
    );
  }
}

class ElectionPreview extends StatelessWidget {
  final ElectionDto election;
  final VoterDto voter;

  const ElectionPreview(
    this.election,
    this.voter, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    String remainingTime = election.endTime.remainingTimeString();
    final highestVoteCount = election.candidates
        .fold<int>(0, (max, obj) => obj.voteCount > max ? obj.voteCount : max);

    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => nav.push(
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => VotePageCubit(election, voter.voterId),
                child: const VotePage(),
              ),
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.flag_outlined, color: Colors.yellow),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(election.name),
                          Text(
                              "Ending ${DateFormat('dd/MM/yyyy HH:mm:ss').format(election.endTime)} ($remainingTime)"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Candidates:"),
                      for (CandidateDto candidate in election.candidates.randomise())
                        Opacity(
                          opacity: candidate.voteCount == highestVoteCount
                              ? 1
                              : 0.5,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(
                                      int.parse(
                                          "0xFF${candidate.colour.toUpperCase()}"),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.person_outline),
                                      Text(candidate.name),
                                      if (election.endTime
                                          .isBefore(DateTime.now()))
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child:
                                              Text("[${candidate.voteCount}]"),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
