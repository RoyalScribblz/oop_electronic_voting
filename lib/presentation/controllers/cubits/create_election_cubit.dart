import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/models/cubit_models/create_election.dart';
import 'package:oop_electronic_voting/data/repositories/candidate_repository.dart';
import 'package:oop_electronic_voting/data/repositories/contracts/election/create_election_request.dart';

import '../../../data/repositories/contracts/candidate/candidate.dart';
import '../../../data/repositories/election_repository.dart';

class CreateElectionCubit extends Cubit<CreateElection> {
  CreateElectionCubit(Credentials credentials)
      : super(
          CreateElection(
            credentials,
            "",
            DateTime.now().toString(),
            DateTime.now().toString(),
            {},
          ),
        );

  Future getCandidates() async {
    Map<Candidate, bool> candidates = {};
    candidates.addAll(state.candidates);

    List<Candidate> receivedCandidates =
        await CandidateRepository.getCandidates();

    for (Candidate candidate in receivedCandidates) {
      candidates[candidate] = false;
    }

    emit(CreateElection(state.credentials, state.name, state.startTime,
        state.endTime, candidates));
  }

  void toggleCandidate(Candidate candidate, bool value) {
    Map<Candidate, bool> candidates = {};
    candidates.addAll(state.candidates);

    if (candidates.containsKey(candidate)) {
      candidates[candidate] = value;
    }

    emit(CreateElection(state.credentials, state.name, state.startTime,
        state.endTime, candidates));
  }

  void updateName(String value) => emit(CreateElection(state.credentials, value,
      state.startTime, state.endTime, state.candidates));

  void updateStartTime(String value) => emit(CreateElection(
      state.credentials, state.name, value, state.endTime, state.candidates));

  void updateEndTime(String value) => emit(CreateElection(
      state.credentials, state.name, state.startTime, value, state.candidates));

  Future createElection() async {
    CreateElectionRequest createRequest = CreateElectionRequest(
      name: state.name,
      startTime: DateTime.tryParse(state.startTime) ?? DateTime.now(),
      endTime: DateTime.tryParse(state.endTime) ?? DateTime.now(),
      candidateIds: state.candidates.entries
          .where((e) => e.value == true)
          .map((e) => e.key.candidateId)
          .toList(),
    );

    await ElectionRepository.createElection(createRequest, state.credentials);
  }
}
