import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/repositories/ballot_repository.dart';
import 'package:oop_electronic_voting/data/repositories/contracts/ballot/create_ballot_request.dart';

import '../../../data/models/dtos/ballot/ballot_dto.dart';
import '../../../data/models/dtos/candidate/candidate_dto.dart';
import '../../controllers/cubits/vote_page_cubit.dart';

class VotePage extends StatelessWidget {
  const VotePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    VotePageCubit votePageCubit = context.watch<VotePageCubit>();

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text("Vote"),
                  BlocProvider(
                    create: (_) => votePageCubit,
                    child: const CandidateSelector(),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      if (votePageCubit.state.selectedCandidate != null) {
                        BallotDto? ballot = await BallotRepository.createBallot(
                          CreateBallotRequest(
                            electionId: votePageCubit.state.election.electionId,
                            voterId: votePageCubit.state.voterId,
                            candidateId: votePageCubit.state.selectedCandidate!.candidateId,
                          ),
                        );

                        if (ballot != null) {
                          nav.pop();
                        }
                      }
                    },
                    child: const Text("Submit Vote"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CandidateSelector extends StatelessWidget {
  const CandidateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    VotePageCubit votePageCubit = context.watch<VotePageCubit>();

    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          for (CandidateDto candidate
          in votePageCubit.state.election.candidates)
            ListTile(
              title: Text(candidate.name),
              leading: Radio<CandidateDto>(
                value: candidate,
                groupValue: votePageCubit.state.selectedCandidate,
                onChanged: (CandidateDto? value) =>
                    votePageCubit.setSelectedCandidate(value),
              ),
            ),
        ],
      ),
    );
  }
}
