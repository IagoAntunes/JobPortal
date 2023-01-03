import 'package:flutter/material.dart';
import 'package:jobportal/pages/init/widgets/title_widget.dart';

import 'button_widget.dart';

class Head extends StatelessWidget {
  const Head({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleWidget(),
          ButtonStart(size: size),
        ],
      ),
    );
  }
}
