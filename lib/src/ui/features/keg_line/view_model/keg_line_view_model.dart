import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/keg_line_entity.dart';
import '../../../../utils/result.dart';

class KegLineViewModel extends ChangeNotifier {
  KegLineViewModel({required IRepository<KegLineEntity> repository})
    : _repository = repository;

  final IRepository<KegLineEntity> _repository;

  final String title = 'Keg Line';
  String get message => 'Welcome to the Keg Line!';

  List<KegLineEntity> kegLines = <KegLineEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  Future<void> loadKegLines() async {
    final Result<List<KegLineEntity>> result = await _repository.getAll();
    if (result is Ok<List<KegLineEntity>>) {
      kegLines = result.value;
    } else {
      kegLines = <KegLineEntity>[];
      //? Optional: Error handling, e.g. save error message
    }
    notifyListeners();
  }
}
