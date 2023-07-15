import 'dart:async';
import 'dart:convert';

import 'package:flaconi_case_study/core/common_models/error_model.dart';
import 'package:flaconi_case_study/core/constants/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class BaseService {
  Future<http.Response> getWS({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> params = const <String, dynamic>{},
  }) async {
    try {
      String url = '$baseUrl$uri';
      final Map<String, dynamic> globalParams = {
        accessKey: accessKeyValue,
      };
      if (params.isNotEmpty) {
        globalParams.addAll(params);
      }
      final Uri _uri = Uri.parse(url).replace(queryParameters: globalParams);
      final http.Response response =
          await http.get(_uri, headers: headers).timeout(timeOutDuration);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final dynamic decodedJson = jsonDecode(response.body);
        if (decodedJson['success'] != null && decodedJson['success'] == false) {
          throw Exception();
        } else {
          return response;
        }
      } else {
        throw Exception();
      }
    } on TimeoutException catch (_) {
      throw Exception();
    } on Exception {
      throw Exception();
    }
  }

  String? _getResponseErrorCode(int statusCode, http.Response response) {
    final Map<String, dynamic> httpErrorJson = json.decode(response.body);
    final String? httpError = ErrorModel.fromJson(httpErrorJson).errorCode;
    if (httpError != null) {
      return httpError;
    }
    return null;
  }

  String? _getResponseMessage(int statusCode, http.Response response) {
    final Map<String, dynamic> httpErrorJson = json.decode(response.body);
    final String? httpError = ErrorModel.fromJson(httpErrorJson).message;
    if (httpError != null) {
      final String utfDecodedError = utf8.decode(httpError.codeUnits);
      return utfDecodedError;
    }
    return null;
  }
}
