import 'package:api_practice/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameListPage extends ConsumerWidget {
  const NameListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parsonDataList = ref.watch(parsonDataListFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
      body: ColoredBox(
        color: Colors.black12,
        child: parsonDataList.when(
          data: (parsonDataList) {
            return ListView.builder(
              itemCount: parsonDataList.length,
              itemBuilder: (BuildContext context, int index) {
                final dynamic parsonData = parsonDataList[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        parsonData['avatar'].toString(),
                      ),
                    ),
                    title: Text(
                      '${parsonData['first_name']} ${parsonData['last_name']}',
                    ),
                    subtitle: Text(
                      '${parsonData['email']}',
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
