import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/line_one_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LineOneViewModel extends ChangeNotifier {
  LineOneViewModel({required IRepository<LineOneEntity> repository})
    : _repository = repository {
    // Initialize the command with the action
    _loadLineOnesCommand = Command0<List<LineOneEntity>>(_loadLineOnes);
    // Execute immediately to load data on init
    _loadLineOnesCommand.execute();
  }

  final IRepository<LineOneEntity> _repository;

  late final Command0<List<LineOneEntity>> _loadLineOnesCommand;

  // Expose the command to the view
  Command0<List<LineOneEntity>> get loadLineOnesCommand => _loadLineOnesCommand;

  final String title = 'Line One';
  String get message => 'Welcome to the Line One!';

  List<LineOneEntity> lineOnes = <LineOneEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<LineOneEntity>>> _loadLineOnes() async {
    final Result<List<LineOneEntity>> result = await _repository.getAll();

    // Update the ViewModel state based on result
    return switch (result) {
      Ok<List<LineOneEntity>>(value: final List<LineOneEntity> lineOneList) =>
        Result<List<LineOneEntity>>.ok(lineOnes = lineOneList),
      Error<List<LineOneEntity>>(error: final Exception error) =>
        Result<List<LineOneEntity>>.error(error),
    };
  }

  @override
  void dispose() {
    _loadLineOnesCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
