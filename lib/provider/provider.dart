import 'package:api_practice/model/person_model.dart';
import 'package:api_practice/repository/person_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final parsonDataListFutureProvider =
    FutureProvider.autoDispose<List<Person>>((ref) {
  final parsonRepository = PersonRepository();
  return parsonRepository.fetchParsonDataList();
});
