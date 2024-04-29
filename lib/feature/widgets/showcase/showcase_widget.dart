import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseBuilder extends StatelessWidget {
  final ScrollController scrollController;
  final Widget Function(BuildContext) builder;

  const ShowCaseBuilder({
    required this.builder,
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      enableAutoScroll: true,
      onStart: (index, key) {
        if (index! > 2 && index < 5) {
          scrollController.jumpTo(100);
        }
      },
      onFinish: (){
        scrollController.jumpTo(0);
      },
      autoPlay: true,
      builder: Builder(
        builder: (BuildContext context) {
          return builder(context);
        },
      ),
    );
  }
}
