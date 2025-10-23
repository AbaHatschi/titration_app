import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_one_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LineOneViewModel extends ChangeNotifier {
  LineOneViewModel({required IRepository<LineOneEntity> repository})
    : _repository = repository {
    _loadLineOnesCommand = Command0<List<LineOneEntity>>(_loadLineOnes);
    _loadLineOnesCommand.execute();
  }

  final IRepository<LineOneEntity> _repository;

  late final Command0<List<LineOneEntity>> _loadLineOnesCommand;
  Command0<List<LineOneEntity>> get loadLineOnesCommand => _loadLineOnesCommand;

  final String title = 'Line One';
  String get message => 'Welcome to the Line One!';

  List<LineOneEntity> _lineOnes = <LineOneEntity>[];
  List<LineOneEntity> get lineOnes => _lineOnes;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<LineOneEntity>>> _loadLineOnes() async {
    final Result<List<LineOneEntity>> result = await _repository.getAll();

    return switch (result) {
      Ok<List<LineOneEntity>>(value: final List<LineOneEntity> listItems) =>
        Result<List<LineOneEntity>>.ok(() {
          _lineOnes = listItems;
          _errorMessage = null;
          notifyListeners();
          return listItems;
        }()),
      Error<List<LineOneEntity>>(error: final Exception error) =>
        Result<List<LineOneEntity>>.error(() {
          _lineOnes = <LineOneEntity>[];
          _errorMessage = error.toString();
          notifyListeners();
          return error;
        }()),
    };
  }

  @override
  void dispose() {
    _loadLineOnesCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
