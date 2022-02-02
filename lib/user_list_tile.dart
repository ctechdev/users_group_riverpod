import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/models/user.dart';

class UserListTile extends ConsumerWidget {
  const UserListTile({Key? key, required this.user, this.onTap})
      : super(key: key);
  final User user;
  final VoidCallback? onTap;
  // callback per assegnare poi l'azione con la gesture dedector
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        trailing: SizedBox(
          width: 70,
          height: 20,
          child: ElevatedButton(
            //style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => ref.read(usersListProvider.notifier).remove(user),

            child: Text('REMOVE', style: const TextStyle(fontSize: 9)),
          ),
        ),
        leading: Container(
          width: 32, height: 32,
          //padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            //border: Border.all(width: 2),
            shape: BoxShape.circle,
            color: Colors.blue[100],
          ),
          child: Center(
            child: Text(getInitials(user.name!),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        title: Text(user.name!,
            style: const TextStyle(fontWeight: FontWeight.bold)));
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
}
