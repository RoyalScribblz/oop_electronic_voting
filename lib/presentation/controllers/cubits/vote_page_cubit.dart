import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/models/cubit_models/vote_page_data.dart';
import 'package:oop_electronic_voting/data/models/dtos/candidate/candidate_dto.dart';
import 'package:oop_electronic_voting/data/models/dtos/voter/voter_dto.dart';

import '../../../data/models/dtos/election/election_dto.dart';

class VotePageCubit extends Cubit<VotePageData> {
  VotePageCubit(ElectionDto election, VoterDto voter) : super(VotePageData(election, null, voter));

  void setSelectedCandidate(CandidateDto? candidateDto) =>
      emit(VotePageData(state.election, candidateDto, state.voter));
}
