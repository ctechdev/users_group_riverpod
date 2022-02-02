import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/providers.dart';

class SearchBar extends HookConsumerWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: SizedBox(
          height: 40.0,
          width: double.infinity,
          child: CupertinoTextField(
            controller: textEditingController,
            onChanged: (value) => {ref.read(queryFilterProvider.notifier).state = value,
            ref.refresh(filteredUsersProvider)},
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
    );
  }
}
