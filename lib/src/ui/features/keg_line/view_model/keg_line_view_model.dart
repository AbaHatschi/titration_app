import 'package:flutter/foundation.dart';

import '../../../../data/repositories/keg_line_repository.dart';
import '../../../../domain/keg_line_entity.dart';
import '../../../../utils/result.dart';

class KegLineViewModel extends ChangeNotifier {
  KegLineViewModel({required KegLineRepository kegLineRepository})
    : _kegLineRepository = kegLineRepository;

  final KegLineRepository _kegLineRepository;

  final String title = 'Keg Line';
  String get message => 'Welcome to the Keg Line!';

  List<KegLineEntity> kegLines = <KegLineEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  Future<void> loadKegLines() async {
    final Result<List<KegLineEntity>> result = await _kegLineRepository
        .getAll();
    if (result is Ok<List<KegLineEntity>>) {
      kegLines = result.value;
    } else {
      kegLines = <KegLineEntity>[];
      //? Optional: Error handling, e.g. save error message
    }
    notifyListeners();
  }
}
