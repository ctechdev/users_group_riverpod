import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:list_users_riverpod/models/user.dart';
import 'package:list_users_riverpod/services/fake_users_api.dart';

final userProvider = FutureProvider.autoDispose((ref) async {
  return UsersApi().getUsers();
});

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(ref);
});

class Counter extends StateNotifier<int> {
  Counter(this.ref) : super(0);

  final Ref ref;

  int myUsersCount() {
    final counter = ref.watch(usersListProvider.notifier);
    return counter.state.length;
  }
}

final queryFilterProvider = StateProvider.autoDispose((ref) => '');

final filteredUsersProvider = Provider.autoDispose<List<User>>((ref) {
  final query = ref.watch(queryFilterProvider);
  final users = ref.watch(userProvider).value;
  if (users != null) {
    var tempList = [...users];

    final resultFilter = tempList
        .where((User user) =>
            user.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return resultFilter;
  }
  return [];
});
