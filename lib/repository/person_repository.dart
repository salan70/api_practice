import 'package:dio/dio.dart';

class PersonRepository {
  Future<List<dynamic>> fetchParsonDataList() async {
    List<dynamic> parsonDataList;
    final response = await Dio()
        .get<Map<dynamic, dynamic>>('https://reqres.in/api/users?page=2');

    if (response.statusCode == 200) {
      if (response.data != null) {
        parsonDataList = response.data!['data'] as List<dynamic>;
      } else {
        throw Exception('Data is not exist');
      }
    } else {
      throw Exception('Failed to load sentence');
    }

    return parsonDataList;
  }
}
