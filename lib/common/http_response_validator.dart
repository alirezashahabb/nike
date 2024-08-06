import 'package:dio/dio.dart';
import 'package:nike/common/exception.dart';

mixin HttpResponseValidator {
  validator(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}
