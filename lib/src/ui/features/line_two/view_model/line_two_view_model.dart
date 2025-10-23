import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_two_entity.dart';
import '../../../../utils/result.dart';

class LineTwoViewModel extends ChangeNotifier {
  LineTwoViewModel({required IRepository<LineTwoEntity> repository})
    : _repository = repository;

  final IRepository<LineTwoEntity> _repository;

  final String title = 'Line Two';
  String get message => 'Welcome to Line Two!';

  List<LineTwoEntity> lineTwos = <LineTwoEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  Future<void> loadLineTwos() async {
    final Result<List<LineTwoEntity>> result = await _repository.getAll();
    if (result is Ok<List<LineTwoEntity>>) {
      lineTwos = result.value;
    } else {
      lineTwos = <LineTwoEntity>[];
      //? Optional: Error handling, e.g. save error message
    }
    notifyListeners();
  }
}
