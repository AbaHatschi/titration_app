import 'package:flutter_test/flutter_test.dart';
import 'package:titration_app/main.dart';

void main() {
  test('startApp() runs without error', () async {
    await expectLater(() => startApp(), returnsNormally);
  });
}
