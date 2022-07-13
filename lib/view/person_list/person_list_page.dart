import 'package:api_practice/provider/providers.dart';
import 'package:api_practice/view/person_list/person_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonListPage extends ConsumerWidget {
  const PersonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personDataList = ref.watch(parsonDataListFutureProvider);
    final personListViewModel = PersonListViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: ColoredBox(
        color: Colors.black12,
        child: Column(
          children: [
            personDataList.when(
              data: (personDataList) {
                final sortedPersonDataList =
                    personListViewModel.sortFirstName(personDataList);

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
