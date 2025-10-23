import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/keg_line_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class KegLineViewModel extends ChangeNotifier {
  KegLineViewModel({required IRepository<KegLineEntity> repository})
    : _repository = repository {
    _loadKegLinesCommand = Command0<List<KegLineEntity>>(_loadKegLines);
    _loadKegLinesCommand.execute();
  }

  final IRepository<KegLineEntity> _repository;

  late final Command0<List<KegLineEntity>> _loadKegLinesCommand;
  Command0<List<KegLineEntity>> get loadKegLinesCommand => _loadKegLinesCommand;

  final String title = 'Keg Line';
  String get message => 'Welcome to the Keg Line!';

  List<KegLineEntity> _kegLines = <KegLineEntity>[];
  List<KegLineEntity> get kegLines => _kegLines;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<KegLineEntity>>> _loadKegLines() async {
    final Result<List<KegLineEntity>> result = await _repository.getAll();

    return switch (result) {
      Ok<List<KegLineEntity>>(value: final List<KegLineEntity> listItems) =>
        Result<List<KegLineEntity>>.ok(() {
          _kegLines = listItems;
          _errorMessage = null;
          notifyListeners();
          return listItems;
        }()),
      Error<List<KegLineEntity>>(error: final Exception error) =>
        Result<List<KegLineEntity>>.error(() {
          _kegLines = <KegLineEntity>[];
          _errorMessage = error.toString();
          notifyListeners();
          return error;
        }()),
    };
  }

  @override
  void dispose() {
    _loadKegLinesCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
