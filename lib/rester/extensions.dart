import 'package:rester/rester/rester_error.dart';
import 'package:rester/rester/rester_response.dart';

extension ResterResponseExtensions on ResterResponse {
  ResterResponse combineSuccess(ResterResponse second) =>
      ResterResponse(success: second.success);

  ResterResponse combineFailure(ResterError error) =>
      ResterResponse(failure: ResterResponseFailure(error: error));
}
