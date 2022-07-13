import 'package:api_practice/model/person_model.dart';
import 'package:api_practice/provider/providers.dart';
import 'package:api_practice/view/name_list/name_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameListPage extends ConsumerWidget {
  const NameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parsonDataList = ref.watch(parsonDataListFutureProvider);
    final nameListViewModel = NameListViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: ColoredBox(
        color: Colors.black12,
        child: Column(
          children: [
            parsonDataList.when(
              data: (personDataList) {
                final sortedPersonDataList =
                    nameListViewModel.sortFirstName(personDataList);

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sortedPersonDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final personData = sortedPersonDataList[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            personData.avatar,
                          ),
                        ),
                        title: Text(
                          '${personData.first_name} ${personData.last_name}',
                        ),
                        subtitle: Text(
                          personData.email,
                        ),
                        trailing: Text('id: ${personData.id}'),
                      ),
                    );
                  },
                );
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
