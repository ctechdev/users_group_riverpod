import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/models/user.dart';

//TODO selection icon
class UserGridTile extends HookConsumerWidget {
  const UserGridTile({Key? key, required this.user, this.onTap})
      : super(key: key);
  final User user;
  final VoidCallback? onTap;
  // callback per assegnare poi l'azione con la gesture dedector
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isSelectd = useState(false);

    List<Widget> stackChildren = <Widget>[
      Positioned(
        key: GlobalKey(),
        bottom: 70,
        right: 20,
        child: Opacity(
            opacity: isSelectd.value ? 1 : 0.0,
            child: const Icon(Icons.check_circle,
            color: Colors.green,)),
      ),
      Positioned(
        key: GlobalKey(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
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
      ),
      Opacity(
          opacity: isSelectd.value ? 1 : 0.0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: Colors.blue),
                    shape: BoxShape.circle,
                    color: Colors.blue[100],
                  ),
                  child: Center(
                    child: Text(getInitials(user.name!),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ]))
    ];

    return GestureDetector(
      onTap: () => {
        isSelectd.value = !isSelectd.value,
        if (isSelectd.value){ref.read(usersListProvider.notifier).add(user)}
         else
        ref.read(usersListProvider.notifier).remove(user),
      },
      child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          children: [stackChildren[1],stackChildren[2],stackChildren[0],]),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
      : '';
}
