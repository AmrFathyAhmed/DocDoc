import 'package:flutter/foundation.dart';

import '../api_helper/end_points.dart';
import '../cache/cache_helper.dart';
import 'constants.dart';

Future<void> getUserToken() async {
  token = await CacheHelper().getData(key: ApiKeys.token);
  if (kDebugMode) {
    print(token);
  }
}
