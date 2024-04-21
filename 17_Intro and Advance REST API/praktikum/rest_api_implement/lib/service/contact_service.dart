import 'package:dio/dio.dart';

class ContactService {
  static Future<void> postContact(
      {required String? name, required String? phone}) async {
    try {
      final Response response = await Dio().post(
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
          data: {
            'name': name,
            'phone': phone,
          });

      print(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
