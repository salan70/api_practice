import 'package:api_practice/model/person_model.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  Future<List<Person>> fetchParsonDataList() async {
    List<dynamic> responseDataList;
    final personDataList = <Person>[];
    final response = await Dio()
        .get<Map<dynamic, dynamic>>('https://reqres.in/api/users?page=2');

    if (response.statusCode == 200) {
      if (response.data != null) {
        responseDataList = response.data!['data'] as List<dynamic>;
        for (final responseData in responseDataList) {
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
