import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/confirm_widget.dart';
import 'package:list_users_riverpod/grid_items_builder.dart';
import 'package:list_users_riverpod/models/user.dart';
import 'package:list_users_riverpod/user_grid_tile.dart';
import 'package:list_users_riverpod/user_selector.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String title = 'Test';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(usersListProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Row(children: [
                Column(
                  children: const [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          showUserSelector(context);
                          //showMenu(context);
                        },
                        child: Text('Groups',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridBuilder(
                    data: selectedUsers,
                    itemBuilder: (BuildContext context, User user) =>
                        UserGridTile(
                      user: user,
                      onTap: () => {},
                    ),
                  ))
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => showConfirm(context),
            child: Text('CONTINUE'),
          ),
        ),
      ),
    );
  }

  Future<void> showUserSelector(BuildContext context) {
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return const UserSelector();
        });
  }

  Future<void> showConfirm(BuildContext context) {
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return const ConfirmWidget();
        });
  }
}
