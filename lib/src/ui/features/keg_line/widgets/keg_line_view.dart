import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/keg_line_entity.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';
import '../view_model/keg_line_view_model.dart';

class KegLineView extends StatelessWidget {
  const KegLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KegLineViewModel>(
      builder: (BuildContext context, KegLineViewModel kegLineViewModel, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: kegLineViewModel.navigateToDashboard,
          builder: (BuildContext context, bool shouldNavigate, _) {
            if (shouldNavigate) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                DashboardRoute().go(context);
                kegLineViewModel.navigateToDashboard.value = false;
              });
            }

            return Scaffold(
              appBar: AppBar(title: Text(kegLineViewModel.title)),
              body: Center(
                child: ListenableBuilder(
                  listenable: kegLineViewModel.loadKegLinesCommand,
                  builder: (BuildContext context, _) {
                    final Command0<List<KegLineEntity>> kegLineCommand =
                        kegLineViewModel.loadKegLinesCommand;

                    // Loading State
                    if (kegLineCommand.running) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Loading Keg Lines...'),
                        ],
                      );
                    }

                    // Error State
                    if (kegLineCommand.error) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 64,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Failed to load Keg Lines',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (kegLineCommand.result != null)
                            Text(
                              kegLineCommand.result is Error
                                  ? (kegLineCommand.result!
                                            as Error<List<KegLineEntity>>)
                                        .error
                                        .toString()
                                  : 'Unknown error',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: kegLineCommand.execute,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      );
                    }

                    // Success State - Empty
                    if (kegLineViewModel.kegLines.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.inbox_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No Keg Lines found',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: kegLineCommand.execute,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reload'),
                          ),
                        ],
                      );
                    }

                    // Success State - With Data
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: kegLineViewModel.kegLines.length,
                            itemBuilder: (BuildContext context, int index) {
                              final KegLineEntity kegLine =
                                  kegLineViewModel.kegLines[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text('${kegLine.id}'),
                                ),
                                title: Text('Keg Line ${kegLine.id}'),
                                subtitle: Text(
                                  'pLye1: ${kegLine.pLye1.toStringAsFixed(2)}',
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton.icon(
                                onPressed: kegLineCommand.execute,
                                icon: const Icon(Icons.refresh),
                                label: const Text('Reload'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    kegLineViewModel.onDashboardButtonPressed(),
                                child: const Text('Dashboard'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
