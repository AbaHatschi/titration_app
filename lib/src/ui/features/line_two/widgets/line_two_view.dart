import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/line_two_entity.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/command.dart';
import '../../../../utils/result.dart';
import '../view_model/line_two_view_model.dart';

class LineTwoView extends StatelessWidget {
  const LineTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineTwoViewModel>(
      builder: (BuildContext context, LineTwoViewModel lineTwoViewModel, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: lineTwoViewModel.navigateToDashboard,
          builder: (BuildContext context, bool shouldNavigate, _) {
            if (shouldNavigate) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                DashboardRoute().go(context);
                lineTwoViewModel.navigateToDashboard.value = false;
              });
            }

            return Scaffold(
              appBar: AppBar(title: Text(lineTwoViewModel.title)),
              body: Center(
                child: ListenableBuilder(
                  listenable: lineTwoViewModel.loadLineTwosCommand,
                  builder: (BuildContext context, _) {
                    final Command0<List<LineTwoEntity>> lineTwoCommand =
                        lineTwoViewModel.loadLineTwosCommand;

                    // Loading State
                    if (lineTwoCommand.running) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Loading Line Twos...'),
                        ],
                      );
                    }

                    // Error State
                    if (lineTwoCommand.error) {
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
                            'Failed to load Line Twos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (lineTwoCommand.result != null)
                            Text(
                              lineTwoCommand.result is Error
                                  ? (lineTwoCommand.result!
                                            as Error<List<LineTwoEntity>>)
                                        .error
                                        .toString()
                                  : 'Unknown error',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: lineTwoCommand.execute,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      );
                    }

                    // Success State - Empty
                    if (lineTwoViewModel.lineTwos.isEmpty) {
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
                            'No Line Twos found',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: lineTwoCommand.execute,
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
                            itemCount: lineTwoViewModel.lineTwos.length,
                            itemBuilder: (BuildContext context, int index) {
                              final LineTwoEntity lineTwo =
                                  lineTwoViewModel.lineTwos[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text('${lineTwo.id}'),
                                ),
                                title: Text('Line Two ${lineTwo.id}'),
                                subtitle: Text(
                                  'pLye1: ${lineTwo.pLye1.toStringAsFixed(2)}',
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
                                onPressed: lineTwoCommand.execute,
                                icon: const Icon(Icons.refresh),
                                label: const Text('Reload'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    lineTwoViewModel.onDashboardButtonPressed(),
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
