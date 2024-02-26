import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/repositories/election_repository.dart';

import '../../../data/models/dtos/election/election_dto.dart';

class ElectionsCubit extends Cubit<List<ElectionDto>> {
  ElectionsCubit() : super([]);

  Future getElections() async => emit(await ElectionRepository.getElections());
}