import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cubit_models/election.dart';

class ElectionsCubit extends Cubit<List<Election>> {
  ElectionsCubit() : super([]);

  void setElections(List<Election> elections) => emit([...elections]);
}