import 'package:api_practice/repository/person_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final parsonDataListFutureProvider =
    FutureProvider.autoDispose<List<dynamic>>((ref) {
  final parsonRepository = PersonRepository();
  return parsonRepository.fetchParsonDataList();
});
