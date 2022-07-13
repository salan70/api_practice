import 'package:api_practice/model/person_model.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  Future<List<Person>> fetchParsonDataList() async {
    List<dynamic> responseDataList;
    final personDataList = <Person>[];

    // 利用するAPIのURL
    const url = 'https://reqres.in/api/users?page=2';
    final response = await Dio().get<Map<dynamic, dynamic>>(url);

    if (response.statusCode == 200) {
      // null check
      if (response.data != null) {
        // responseのdataを一旦、dynamic型のListとして格納
        responseDataList = response.data!['data'] as List<dynamic>;

        for (final responseData in responseDataList) {
          // Listの要素を1つ1つPerson(自作の型)に変換し、返すListに追加していく
          personDataList
              .add(Person.fromJson(responseData as Map<String, dynamic>));
        }
      } else {
        throw Exception('Data is not exist');
      }
    } else {
      throw Exception('Failed to load sentence');
    }

    return personDataList;
  }
}
