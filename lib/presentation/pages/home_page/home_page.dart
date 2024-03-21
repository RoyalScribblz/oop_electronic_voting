import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oop_electronic_voting/extensions/credentials_extensions.dart';
import 'package:oop_electronic_voting/extensions/datetime_extensions.dart';
import 'package:oop_electronic_voting/extensions/list_extensions.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/user_cubit.dart';
import 'package:oop_electronic_voting/presentation/pages/admin_page/admin_page.dart';
import 'package:oop_electronic_voting/presentation/pages/vote_page/vote_page.dart';

import '../../../data/models/dtos/candidate/candidate_dto.dart';
import '../../../data/models/dtos/election/election_dto.dart';
import '../../../data/models/dtos/user/user_dto.dart';
import '../../controllers/cubits/vote_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    ElectionsCubit electionsCubit = context.read<ElectionsCubit>();
    electionsCubit.getElections();
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);

    IdentityCubit identityCubit = context.watch<IdentityCubit>();

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
            if (identityCubit.state.credentials.isAdmin())
              ElevatedButton(
                onPressed: () => nav
                    .push(MaterialPageRoute(builder: (_) => const AdminPage())),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Admin Panel"),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome ${identityCubit.state.user!.firstName}, you may vote in the following elections:",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            for (ElectionDto election in activeElections)
              ElectionPreview(election, identityCubit.state.user!),
            const Text("Finished Elections:", style: TextStyle(fontSize: 20)),
            for (ElectionDto election in completedElections)
              ElectionPreview(election, identityCubit.state.user!),
          ],
        ),
      ),
    );
  }
}

class ElectionPreview extends StatelessWidget {
  final ElectionDto election;
  final UserDto user;

  const ElectionPreview(
    this.election,
    this.user, {
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
                create: (_) => VotePageCubit(election, user.userId),
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
                      for (CandidateDto candidate
                          in election.candidates.randomise())
                        Opacity(
                          opacity:
                              candidate.voteCount == highestVoteCount ? 1 : 0.5,
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
