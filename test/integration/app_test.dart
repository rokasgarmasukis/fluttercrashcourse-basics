import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/app.dart';
import 'package:hello_world/mocks/mock_location.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('test app startup', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      return tester.pumpWidget(App());
    });

    final mockLocation = MockLocation.fetchAny();

    expect(find.text(mockLocation.name), findsOneWidget);
    expect(find.text('${mockLocation.name}blah'), findsNothing);
  });
}
