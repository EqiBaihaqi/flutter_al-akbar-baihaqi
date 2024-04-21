import 'package:dio/dio.dart';

class PutData {
  static Future<void> putData() async {
    Dio dio = Dio();

    try {
      final Response response =
          await dio.put("https://jsonplaceholder.typicode.com/posts/1", data: {
        'id': 1,
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      });
      print(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
