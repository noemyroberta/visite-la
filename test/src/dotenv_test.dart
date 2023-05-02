import 'package:dotenv/dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(()  {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Ensure .env file has API_KEY', () {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    final apiKey = env['API_KEY'];

    expect(apiKey, 'AIzaSyDqtk8D5jg9fEyuHu_1qb-DWcSEbRGIj_A');
  });
}