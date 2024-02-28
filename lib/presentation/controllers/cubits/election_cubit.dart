import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/dtos/election/election_dto.dart';

class ElectionCubit extends Cubit<ElectionDto> {
  ElectionCubit(super.election);
}