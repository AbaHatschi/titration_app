import 'package:flutter/foundation.dart';

import '../../../../data/repositories/i_repository.dart';
import '../../../../domain/keg_line_entity.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class KegLineViewModel extends ChangeNotifier {
  KegLineViewModel({required IRepository<KegLineEntity> repository})
    : _repository = repository {
    // Initialize the command with the action
    _loadKegLinesCommand = Command0<List<KegLineEntity>>(_loadKegLines);
    // Execute immediately to load data on init
    _loadKegLinesCommand.execute();
  }

  final IRepository<KegLineEntity> _repository;

  late final Command0<List<KegLineEntity>> _loadKegLinesCommand;

  // Expose the command to the view
  Command0<List<KegLineEntity>> get loadKegLinesCommand => _loadKegLinesCommand;

  final String title = 'Keg Line';
  String get message => 'Welcome to the Keg Line!';

  List<KegLineEntity> kegLines = <KegLineEntity>[];
  final ValueNotifier<bool> navigateToDashboard = ValueNotifier<bool>(false);

  void onDashboardButtonPressed() {
    navigateToDashboard.value = true;
  }

  /// The action executed by the command
  Future<Result<List<KegLineEntity>>> _loadKegLines() async {
    final Result<List<KegLineEntity>> result = await _repository.getAll();

    // Update the ViewModel state based on result
    return switch (result) {
      Ok<List<KegLineEntity>>(value: final List<KegLineEntity> kegLineList) =>
        Result<List<KegLineEntity>>.ok(kegLines = kegLineList),
      Error<List<KegLineEntity>>(error: final Exception error) =>
        Result<List<KegLineEntity>>.error(error),
    };
  }

  @override
  void dispose() {
    _loadKegLinesCommand.dispose();
    navigateToDashboard.dispose();
    super.dispose();
  }
}
