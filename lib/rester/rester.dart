import 'dart:io';

import 'package:rester/rester/extensions.dart';
import 'package:rester/rester/rester_error.dart';
import 'package:rester/rester/util.dart';
import 'package:rester/rester/rester_methods.dart';
import 'package:rester/rester/rester_middleware.dart';
import 'package:rester/rester/rester_request.dart';
import 'package:rester/rester/rester_response.dart';
import 'package:rester/rester/rester_type.dart';

class Rester {
  final String baseUrl;
  final ResterMiddleware? middleware;
  final int? timeout;
  static final rester = _ResterImpl();
  Rester({required this.baseUrl, this.middleware, this.timeout});

  Future<ResterResponse> call(ResterRequest requestModel) async {
    String uri = Util.createUri(baseUrl, requestModel.endpoint);
    Map<String, String>? headers = requestModel.headers;
    headers ??= {};
    if (requestModel.formData) {
      headers[HttpHeaders.contentTypeHeader] =
          'application/x-www-form-urlencoded; charset=utf-8';
    } else {
      headers[HttpHeaders.contentTypeHeader] =
          'application/json; charset=utf-8';
    }
    int? tempTimeout = requestModel.timeout ?? timeout;
    final createdRequest = requestModel.copyWith(
        endpoint: uri, headers: headers, timeout: tempTimeout);
    ResterResponse resterResponse = const ResterResponse();
    try {
      final response = await _call(createdRequest);
      resterResponse = resterResponse.combineSuccess(response);
      middleware?.handleSucceed(createdRequest, resterResponse);
    } on ServerError catch (error) {
      resterResponse = resterResponse.combineFailure(error);
      middleware?.handleFailed(createdRequest, resterResponse);
    } on TimeoutError catch (error) {
      resterResponse = resterResponse.combineFailure(error);
      middleware?.handleFailed(createdRequest, resterResponse);
    }
    return resterResponse;
  }

  Future<ResterResponse> _call(ResterRequest requestModel) async {
    switch (requestModel.type) {
      case ResterType.get:
        return rester.get(requestModel);
      case ResterType.post:
        return rester.post(requestModel);
      case ResterType.put:
        return rester.put(requestModel);
      case ResterType.patch:
        return rester.patch(requestModel);
      case ResterType.delete:
        return rester.delete(requestModel);
      case ResterType.head:
        return rester.head(requestModel);
    }
  }
}

class _ResterImpl implements ResterMethods {
  static final _ResterImpl _instance = _ResterImpl._internal();
  factory _ResterImpl() {
    return _instance;
  }
  _ResterImpl._internal();

  @override
  Future<ResterResponse> get(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "get", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<ResterResponse> post(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "post", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<ResterResponse> put(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "put", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<ResterResponse> patch(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "patch", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<ResterResponse> delete(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "delete", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }

  @override
  Future<ResterResponse> head(ResterRequest requestModel) {
    try {
      return Future.value(const ResterResponse(
          success: ResterResponseSuccess(message: "head", statusCode: 200)));
    } catch (_) {
      throw ServerError();
    }
  }
}
