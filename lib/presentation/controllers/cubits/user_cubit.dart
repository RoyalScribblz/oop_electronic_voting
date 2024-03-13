import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cubit_models/user.dart';
import '../../../data/models/dtos/user/user_dto.dart';
import '../../../data/repositories/user_repository.dart';

class IdentityCubit extends Cubit<Identity> {
  IdentityCubit() : super(Identity(null, null));

  Future updateIdentity(Credentials? credentials) async {
    UserDto? user;

    if (credentials != null){
      user = await UserRepository.getUser(credentials.user.sub);
    }

    emit(Identity(credentials, user));
  }

  Future createAndSetUser(UserDto user) async {
    await UserRepository.createUser(user);

    emit(Identity(state.credentials, user));
  }
}
