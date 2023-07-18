import 'dart:async';
import 'dart:convert';

import 'package:flaconi_case_study/core/common_models/error_model.dart';
import 'package:flaconi_case_study/core/exceptions/generic_exception.dart';
import 'package:flaconi_case_study/core/exceptions/server_exception.dart';
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
      final Uri tempUri = Uri.parse(url).replace(queryParameters: globalParams);
      final http.Response response =
          await http.get(tempUri, headers: headers).timeout(timeOutDuration);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final dynamic decodedJson = jsonDecode(response.body);
        if (decodedJson['success'] != null && decodedJson['success'] == false) {
          ErrorModel errorModel = ErrorModel.fromJson(decodedJson);
          throw ServerException(info: errorModel.message);
        } else {
          return response;
        }
      } else {
        throw GenericException(
            statusCode: response.statusCode,
            message: 'Status code is different than success codes');
      }
    } on Exception {
      throw ServerException(info: 'Server Exception');
    }
  }
}
