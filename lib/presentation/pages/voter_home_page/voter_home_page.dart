import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oop_electronic_voting/extensions/datetime_extensions.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/user_cubit.dart';
import 'package:oop_electronic_voting/presentation/pages/vote_page/vote_page.dart';

import '../../../data/models/cubit_models/user.dart';
import '../../../data/models/dtos/candidate/candidate_dto.dart';
import '../../../data/models/dtos/election/election_dto.dart';
import '../../controllers/cubits/election_cubit.dart';
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
    User user = context.watch<UserCubit>().state;
    List<ElectionDto> elections = context.watch<ElectionsCubit>().state;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome ${user.voter!.firstName}, you may vote in the following elections:",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            for (ElectionDto election in elections) ElectionPreview(election)
          ],
        ),
      ),
    );
  }
}

class ElectionPreview extends StatelessWidget {
  final ElectionDto election;

  const ElectionPreview(
    this.election, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    String remainingTime = election.endTime.remainingTimeString();

    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => nav.push(
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => VotePageCubit(election),
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
                      for (CandidateDto candidate in election.candidates)
                        Row(
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
                                    Text(candidate.name)
                                  ],
                                ),
                              ),
                            ),
                          ],
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
