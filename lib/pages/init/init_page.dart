import 'package:flutter/material.dart';
import 'package:jobportal/pages/init/widgets/head_widget.dart';
import 'package:jobportal/utils/colors.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Head(size: size),
            const Expanded(child: SizedBox()),
            Image.asset('assets/images/backgroundInit.png')
          ],
        ),
      ),
    );
  }
}
