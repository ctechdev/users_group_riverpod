import 'package:flutter/material.dart';
import 'package:list_users_riverpod/models/user.dart';

class UserGridTile extends StatelessWidget {
  const UserGridTile({Key? key, required this.user, this.onTap})
      : super(key: key);
  final User user;
  final VoidCallback? onTap;
  // callback per assegnare poi l'azione con la gesture dedector
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text(getInitials(user.name!),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(user.name!,
                  style: const TextStyle(
                    fontSize: 12,
                  )),
            ),
            Text(user.username!,
            style: const TextStyle(
                    fontSize: 10,
                  ))
          ]),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
}
