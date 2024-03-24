import 'dart:ui';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/models/cubit_models/create_candidate.dart';
import 'package:oop_electronic_voting/data/repositories/candidate_repository.dart';
import 'package:oop_electronic_voting/data/repositories/contracts/candidate/create_candidate_request.dart';

class CreateCandidateCubit extends Cubit<CreateCandidate> {
  CreateCandidateCubit(Credentials credentials)
      : super(CreateCandidate(credentials, "", "", "3289a8"));

  void setName(String value) => emit(
      CreateCandidate(state.credentials, value, state.imageUrl, state.colour));

  void setImageUrl(String value) =>
      emit(CreateCandidate(state.credentials, state.name, value, state.colour));

  void setColour(String value) => emit(
      CreateCandidate(state.credentials, state.name, state.imageUrl, value));

  Color getColour() => Color(int.parse("0xFF${state.colour}"));

  Future createCandidate() async {
    CreateCandidateRequest createRequest = CreateCandidateRequest(
      name: state.name,
      imageUrl: state.imageUrl,
      colour: state.colour
    );

    await CandidateRepository.createCandidate(createRequest, state.credentials);
  }
}
