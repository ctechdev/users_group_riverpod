import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/grid_items_builder.dart';
import 'package:list_users_riverpod/models/user.dart';
import 'package:list_users_riverpod/user_list_tile.dart';

class ConfirmGroup extends ConsumerWidget {
  const ConfirmGroup({Key? key}) : super(key: key);

  final String title = 'Test';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(usersListProvider);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => {},
            child: Text('CONFIRM'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
              ]),
              Row(children: [
                Column(
                  children: [
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
                        child: Text('Confirm members?',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[Text('? ' '/ 30')],
                ),
              ]),
              Expanded(
                  child: ListBuilder(
                data: selectedUsers,
                itemBuilder: (context, User user) => UserListTile(user: user),
              )),
            ]),
          ),
        ),
      ),
    );
  }
}

// Container(
//                  width: MediaQuery.of(context).size.width,
//               height:  MediaQuery.of(context).size.height,
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 8, vertical: 12),
//                     child: ListBuilder<User>(
//                       data: selectedUsers,
//                       itemBuilder: (BuildContext context, User user) =>
//                           UserListTile(
//                         user: user,
//                         onTap: () => {},
//                       ),
//                     )
//                                          ),

// Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(children: [
//               Row(children: [
//                 Column(
//                   children: [
//                     SizedBox(
//                       width: 24,
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Raimbows',
//                           style: TextStyle(
//                               color: Colors.blue[700],
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//               ]),
//               Row(children: [
//                 Column(
//                   children: const <Widget>[
//                     SizedBox(
//                       width: 24,
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SizedBox(
//                         width: 200,
//                         child: Text('Confirm members?',
//                             style: TextStyle(
//                                 color: Colors.blue[700],
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[Text('? ' '/ 30')],
//                 ),
//               ]),
//               Expanded(
                
//                   child: ListBuilder<User>(
//                 data: selectedUsers,
//                 itemBuilder: (BuildContext context, User user) => UserListTile(
//                   user: user,
//                   onTap: () => {},
//                 ),
//               )),
//             ]),
//           ),
//         ),