import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/models/cubit_models/vote_page_data.dart';
import 'package:oop_electronic_voting/data/models/dtos/candidate/candidate_dto.dart';
import 'package:oop_electronic_voting/extensions/list_extensions.dart';

import '../../../data/models/dtos/election/election_dto.dart';

class VotePageCubit extends Cubit<VotePageData> {
  VotePageCubit(ElectionDto election, String userId, Credentials? credentials)
      : super(
          VotePageData(
            election,
            null,
            userId,
            credentials,
          ),
        ) {
    state.election.candidates.randomise();
  }

  void setSelectedCandidate(CandidateDto? candidateDto) => emit(
        VotePageData(
          state.election,
          candidateDto,
          state.userId,
          state.credentials,
        ),
      );
}
