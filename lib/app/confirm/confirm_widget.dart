import 'package:flutter/material.dart';

import 'confirm_content.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return const ConfirmGroup();
      },
    );
  }
}
