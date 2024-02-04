import 'package:rester/rester/rester_request.dart';
import 'package:rester/rester/rester_response.dart';

abstract class ResterMiddleware {
  void handleSucceed(ResterRequest request, ResterResponse response);
  void handleFailed(ResterRequest request, ResterResponse response);
}
