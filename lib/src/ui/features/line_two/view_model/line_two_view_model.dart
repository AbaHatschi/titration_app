import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_two_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LineTwoViewModel extends ChangeNotifier {
  LineTwoViewModel({required IRepository<LineTwoEntity> repository})
    : _repository = repository {
    _loadLineTwosCommand = Command0<List<LineTwoEntity>>(_loadLineTwos);
    _loadLineTwosCommand.execute();
  }

  final IRepository<LineTwoEntity> _repository;

  late final Command0<List<LineTwoEntity>> _loadLineTwosCommand;
  Command0<List<LineTwoEntity>> get loadLineTwosCommand => _loadLineTwosCommand;

  final String title = 'Line Two';
  String get message => 'Welcome to the Line Two!';

  List<LineTwoEntity> _lineTwos = <LineTwoEntity>[];
  List<LineTwoEntity> get lineTwos => _lineTwos;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<LineTwoEntity>>> _loadLineTwos() async {
    final Result<List<LineTwoEntity>> result = await _repository.getAll();

    return switch (result) {
      Ok<List<LineTwoEntity>>(value: final List<LineTwoEntity> listItems) =>
        Result<List<LineTwoEntity>>.ok(() {
          _lineTwos = listItems;
          _errorMessage = null;
          notifyListeners();
          return listItems;
        }()),
      Error<List<LineTwoEntity>>(error: final Exception error) =>
        Result<List<LineTwoEntity>>.error(() {
          _lineTwos = <LineTwoEntity>[];
          _errorMessage = error.toString();
          notifyListeners();
          return error;
        }()),
    };
  }

  @override
  void dispose() {
    _loadLineTwosCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
