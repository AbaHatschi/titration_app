import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_one_entity.dart';
import '../../../../utils/result.dart';

class LineOneViewModel extends ChangeNotifier {
  LineOneViewModel({required IRepository<LineOneEntity> repository})
    : _repository = repository;

  final IRepository<LineOneEntity> _repository;

  final String title = 'Line One';
  String get message => 'Welcome to Line One!';

  List<LineOneEntity> lineOnes = <LineOneEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  Future<void> loadLineOnes() async {
    final Result<List<LineOneEntity>> result = await _repository.getAll();
    if (result is Ok<List<LineOneEntity>>) {
      lineOnes = result.value;
    } else {
      lineOnes = <LineOneEntity>[];
      //? Optional: Error handling, e.g. save error message
    }
    notifyListeners();
  }
}
