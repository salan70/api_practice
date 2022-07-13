import 'package:api_practice/model/person_model.dart';
import 'package:api_practice/repository/person_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personDataListFutureProvider =
    FutureProvider.autoDispose<List<Person>>((ref) async {
  final personRepository = PersonRepository();
  final personDataList = await personRepository.fetchParsonDataList();
  return personDataList;
});
