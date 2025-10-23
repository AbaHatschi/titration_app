import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/line_one_entity.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';
import '../view_model/line_one_view_model.dart';

class LineOneView extends StatelessWidget {
  const LineOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineOneViewModel>(
      builder: (BuildContext context, LineOneViewModel lineOneViewModel, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: lineOneViewModel.navigateToDashboard,
          builder: (BuildContext context, bool shouldNavigate, _) {
            if (shouldNavigate) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                DashboardRoute().go(context);
                lineOneViewModel.navigateToDashboard.value = false;
              });
            }

            return Scaffold(
              appBar: AppBar(title: Text(lineOneViewModel.title)),
              body: Center(
                child: ListenableBuilder(
                  listenable: lineOneViewModel.loadLineOnesCommand,
                  builder: (BuildContext context, _) {
                    final Command0<List<LineOneEntity>> lineOneCommand =
                        lineOneViewModel.loadLineOnesCommand;

                    // Loading State
                    if (lineOneCommand.running) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Loading Line Ones...'),
                        ],
                      );
                    }

                    // Error State
                    if (lineOneCommand.error) {
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
                            'Failed to load Line Ones',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (lineOneCommand.result != null)
                            Text(
                              lineOneCommand.result is Error
                                  ? (lineOneCommand.result!
                                            as Error<List<LineOneEntity>>)
                                        .error
                                        .toString()
                                  : 'Unknown error',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: lineOneCommand.execute,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      );
                    }

                    // Success State - Empty
                    if (lineOneViewModel.lineOnes.isEmpty) {
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
                            'No Line Ones found',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: lineOneCommand.execute,
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
                            itemCount: lineOneViewModel.lineOnes.length,
                            itemBuilder: (BuildContext context, int index) {
                              final LineOneEntity lineOne =
                                  lineOneViewModel.lineOnes[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text('${lineOne.id}'),
                                ),
                                title: Text('Line One ${lineOne.id}'),
                                subtitle: Text(
                                  'pLye1: ${lineOne.pLye1.toStringAsFixed(2)}',
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
                                onPressed: lineOneCommand.execute,
                                icon: const Icon(Icons.refresh),
                                label: const Text('Reload'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    lineOneViewModel.onDashboardButtonPressed(),
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
