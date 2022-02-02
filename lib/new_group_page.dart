import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/grid_items_builder.dart';
import 'package:list_users_riverpod/models/user.dart';
import 'package:list_users_riverpod/providers.dart';
import 'package:list_users_riverpod/search_bar.dart';
import 'package:list_users_riverpod/user_grid_tile.dart';

class NewGroup extends HookConsumerWidget {
  const NewGroup({Key? key}) : super(key: key);

  final String title = 'Test';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> usersAsyncValue = ref.watch(userProvider);
    //TODO
    final query = ref.watch(queryFilterProvider);
    final filteredUsers = ref.watch(filteredUsersProvider);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => {print(query), print(filteredUsers)},
            child: const Text('CONTINUE'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Row(children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Create new group',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ]),
              Row(children: [
                Column(
                  children: [
                    const SizedBox(
                      width: 24,
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Raimbows',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ]),
              Row(children: [
                Column(
                  children: const <Widget>[
                    SizedBox(
                      width: 24,
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: Text('Select members already in Incloodo',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [Text('? ' '/ 30')],
                ),
              ]),
              Row(children: const [
                SizedBox(
                  width: 24,
                ),
                Expanded(child: SearchBar()),
              ]),
              Expanded(
                  child: GridBuilder(
                      data: filteredUsers,
                      itemBuilder: (BuildContext context, User user) =>
                          UserGridTile(
                            user: user,
                            onTap: () =>
                                ref.read(usersListProvider.notifier).add(user),
                          ))),
            ]),
          ),
        ),
      ),
    );
  }
}
