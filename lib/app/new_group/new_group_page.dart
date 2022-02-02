import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/app/confirm/confirm_widget.dart';
import 'package:list_users_riverpod/common%20widgets/grid_items_builder.dart';
import 'package:list_users_riverpod/common%20widgets/user_grid_tile.dart';

import 'package:list_users_riverpod/models/user.dart';
import 'package:list_users_riverpod/providers.dart';

//TODO problema overflow su bottom sheet dopo aggiornamento 
class NewGroup extends ConsumerStatefulWidget {
  const NewGroup({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NewGroupState();
}

class NewGroupState extends ConsumerState<NewGroup> {
  bool isVisible = true;
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final String title = 'Test';

  @override
  Widget build(BuildContext context) {
    final filteredUsers = ref.watch(filteredUsersProvider);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => {showConfirm(context)},
            child: const Text('CONTINUE'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Visibility(
                visible: isVisible,
                child: Row(children: [
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
              ),
              Visibility(
                visible: isVisible,
                child: Row(children: [
                  Column(
                    children: const [
                      SizedBox(
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
              ),
              Visibility(
                visible: isVisible,
                child: Row(children: [
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
              ),
              Row(children: [
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 5,
                      child: SizedBox(
                        height: 40.0,
                        width: double.infinity,
                        child: CupertinoTextField(
                          controller: textEditingController,
                          onChanged: (value) => {
                            if(value.length ==1 ){toggleVisibility()},
                            ref.read(queryFilterProvider.notifier).state = value,
                            ref.refresh(filteredUsersProvider)
                          },
                          keyboardType: TextInputType.text,
                          placeholder: 'Search for Users...',
                          placeholderStyle: const TextStyle(
                            color: Color(0xffC4C6CC),
                            fontSize: 16.0,
                            fontFamily: 'Brutal',
                          ),
                          prefix: const Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 6.0, 4.0, 6.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xffC4C6CC),
                              size: 30,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xffF0F1F5),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    //child: SearchBar()
                    ),
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

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
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
