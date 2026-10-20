
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_inscription/main.dart';

void main() {
  testWidgets('L’application démarre', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MyApp), findsOneWidget);
  });
}


