import 'package:dio/dio.dart';

class DioHelper {
  final String _baseUrl = 'https://api.football-data.org/v2/';
  final String _token = '0cb45860475f4c7aa7eef9cfe98651cf';
  late Dio _dioObject;

  static final DioHelper _dioHelper = DioHelper._internal();

  factory DioHelper() {
    return _dioHelper;
  }

  DioHelper._internal();

  Future<Response> get({String? path, Map<String, dynamic>? params}) async {
    _dioObject = _createObject();
    Response response;
    try {
      if (params == null) {
        params = {'plan': 'TIER_ONE'};
      } else {
        params.addAll({'plan': 'TIER_ONE'});
      }
      response = await _dioObject.get(path!, queryParameters: params);
    } on DioError catch (e) {
      response = e.response!;
    }
    return response;
  }

  Dio _createObject() {
    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        contentType: 'json/application',
        headers: {
          'X-Auth-Token': _token,
        },
      ),
    );
  }
}
