import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/repositories/contracts/user/create_user_request.dart';
import '../../../data/models/cubit_models/user.dart';
import '../../../data/models/dtos/user/user_dto.dart';
import '../../../data/repositories/user_repository.dart';

class IdentityCubit extends Cubit<Identity> {
  IdentityCubit() : super(Identity(null, null));

  Future updateIdentity(Credentials? credentials) async {
    UserDto? user;

    if (credentials != null){
      user = await UserRepository.getUser(credentials);
    }

    emit(Identity(credentials, user));
  }

  Future createAndSetUser(CreateUserRequest user) async {
    UserDto createdUser = await UserRepository.createUser(user, state.credentials!);

    emit(Identity(state.credentials, createdUser));
  }
}
