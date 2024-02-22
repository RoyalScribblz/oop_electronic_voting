import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cubit_models/user.dart';
import '../../../data/models/dtos/voter/voter_dto.dart';
import '../../../data/repositories/voter_repository.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User(null, null));

  Future setCredentialsAndVoter(Credentials? credentials) async {
    VoterDto? voter;

    if (credentials != null){
      voter = await VoterRepository.getVoter(credentials.user.sub);
    }

    emit(User(credentials, voter));
  }

  Future createAndSetVoter(VoterDto voter) async {
    await VoterRepository.createVoter(voter);

    emit(User(state.credentials, voter));
  }
}
