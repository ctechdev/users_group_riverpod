import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/providers.dart';

import 'new_group_page.dart';

class UserSelector extends ConsumerWidget {
  const UserSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return const NewGroup();
      },
    );
  }
}
