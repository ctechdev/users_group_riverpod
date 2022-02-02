import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'empty_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class GridItemsBuilder<T> extends StatelessWidget {
  const GridItemsBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);
  final AsyncValue<List<T>> data;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return data.when(
        data: (items) =>
            items.isNotEmpty ? _buildGrid(items) : const EmptyContent(),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const EmptyContent(
              title: 'Something went wrong',
              message: 'Can\'t load items right now',
            ));
  }

  Widget _buildGrid(List<T> items) {
    return GridView.builder(
        itemCount: items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return itemBuilder(context, items[index]);
        });
  }
}

class GridBuilder<T> extends StatelessWidget {
  const GridBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);
  final List<T> data;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return _buildGrid(data);
  }

 Widget _buildGrid(List<T> items) {
    return GridView.builder(
        itemCount: items.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return itemBuilder(context, items[index]);
        });
  }
}

class ListBuilder<T> extends StatelessWidget {
  const ListBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);
  final List<T> data;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return _buildList(data);
  }

   Widget _buildList(List<T> data) {
    return ListView.builder(
      itemCount: data.length + 2,
      itemBuilder: (context, index) {
        if (index == 0 || index == data.length + 1) {
          return Container(); // zero height: not visible
        }
        return itemBuilder(context, data[index - 1]);
      },
    );
  }
}
