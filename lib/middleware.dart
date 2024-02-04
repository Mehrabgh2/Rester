import 'package:rester/rester/rester_middleware.dart';
import 'package:rester/rester/rester_request.dart';
import 'package:rester/rester/rester_response.dart';

class MiddleWare implements ResterMiddleware {
  @override
  void handleSucceed(ResterRequest request, ResterResponse response) {
    print(request);
  }

  @override
  void handleFailed(ResterRequest request, ResterResponse response) {
    print(request);
  }
}
