import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

main() {
  group('some actions', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      driver?.close();
    });

    test('test pageView horizontal swipe', () async {
      final SerializableFinder pv = find.byValueKey('pageview');
      final SerializableFinder textONMAP = find.text('ON MAP');
      final SerializableFinder textBACK = find.text('BACK');
      final SerializableFinder button = find.byType('AnimatedIcon');

      await driver.waitFor(pv);
      await driver.scroll(pv, -400, 0, Duration(milliseconds: 500));
      await driver.getText(find.text('Travel details'));
      await driver.scroll(pv, 0, -400, Duration(milliseconds: 500));
      await driver.waitFor(textONMAP);
      assert(textONMAP != null);
      await driver.tap(textONMAP);
      await driver.waitFor(textBACK);
      assert(textBACK != null);
      await driver.tap(textBACK);
      await driver.scroll(pv, -400, 0, Duration(milliseconds: 500));
      await driver.tap(button);
      await driver.tap(button);
      await driver.scroll(pv, 400, 0, Duration(milliseconds: 500));
      await driver.scroll(pv, 0, -400, Duration(milliseconds: 500));
      await driver.scroll(pv, 0, 400, Duration(milliseconds: 500));
      await driver.scroll(pv, 400, 0, Duration(milliseconds: 500));
    });
  });
}
