import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_two_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LineTwoViewModel extends ChangeNotifier {
  LineTwoViewModel({required IRepository<LineTwoEntity> repository})
    : _repository = repository {
    // Initialize the command with the action
    _loadLineTwosCommand = Command0<List<LineTwoEntity>>(_loadLineTwos);
    // Execute immediately to load data on init
    _loadLineTwosCommand.execute();
  }

  final IRepository<LineTwoEntity> _repository;

  late final Command0<List<LineTwoEntity>> _loadLineTwosCommand;

  // Expose the command to the view
  Command0<List<LineTwoEntity>> get loadLineTwosCommand => _loadLineTwosCommand;

  final String title = 'Line Two';
  String get message => 'Welcome to the Line Two!';

  List<LineTwoEntity> lineTwos = <LineTwoEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<LineTwoEntity>>> _loadLineTwos() async {
    final Result<List<LineTwoEntity>> result = await _repository.getAll();

    // Update the ViewModel state based on result
    return switch (result) {
      Ok<List<LineTwoEntity>>(value: final List<LineTwoEntity> lineTwoList) =>
        Result<List<LineTwoEntity>>.ok(lineTwos = lineTwoList),
      Error<List<LineTwoEntity>>(error: final Exception error) =>
        Result<List<LineTwoEntity>>.error(error),
    };
  }

  @override
  void dispose() {
    _loadLineTwosCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
