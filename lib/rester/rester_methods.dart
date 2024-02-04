import 'package:rester/rester/rester_request.dart';
import 'package:rester/rester/rester_response.dart';

abstract class ResterMethods {
  Future<ResterResponse> get(ResterRequest requestModel);
  Future<ResterResponse> post(ResterRequest requestModel);
  Future<ResterResponse> put(ResterRequest requestModel);
  Future<ResterResponse> patch(ResterRequest requestModel);
  Future<ResterResponse> delete(ResterRequest requestModel);
  Future<ResterResponse> head(ResterRequest requestModel);
}
