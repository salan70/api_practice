import 'package:api_practice/model/person_model.dart';

class PersonListViewModel {
  List<Person> sortFirstName(List<Person> personDataList) {
    final result = personDataList
      ..sort((a, b) => a.first_name.compareTo(b.first_name));

    return result;
  }
}
