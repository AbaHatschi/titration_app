import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:titration_app/src/data/repositories/i_repository.dart';
import 'package:titration_app/src/data/services/sembast_service.dart';
import 'package:titration_app/src/data/services/shared_preferences_service.dart';
import 'package:titration_app/src/domain/keg_line_entity.dart';

class MockKegLineRepository extends Mock
    implements IRepository<KegLineEntity> {}

class MockSembastService extends Mock implements SembastService {}

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

void main() {
  setUpAll(() {
    //! Here you could make further global setups if needed
  });

  testWidgets('startApp() with mock repository and services runs without errors', (
    WidgetTester tester,
  ) async {
    final MockKegLineRepository mockKegLineRepository = MockKegLineRepository();
    final MockSembastService mockSembastService = MockSembastService();
    final MockSharedPreferencesService mockSharedPreferencesService =
        MockSharedPreferencesService();

    // Mini-widget with the mocked providers
    await tester.pumpWidget(
      MultiProvider(
        providers: <SingleChildWidget>[
          Provider<IRepository<KegLineEntity>>.value(
            value: mockKegLineRepository,
          ),
          Provider<SembastService>.value(value: mockSembastService),
          Provider<SharedPreferencesService>.value(
            value: mockSharedPreferencesService,
          ),
        ],
        child:
            // MainApp could also be placed here if UI is ready
            const Placeholder(), 
      ),
    );

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
