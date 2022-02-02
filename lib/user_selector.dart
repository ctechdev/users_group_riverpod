import 'package:flutter/material.dart';
import 'package:list_users_riverpod/new_group_page.dart';

class UserSelector extends StatelessWidget {
  const UserSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return const NewGroup();
      },
    );
  }
}
