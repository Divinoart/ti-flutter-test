import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCase extends StatelessWidget {
  final String title;
  final String desc;
  final GlobalKey globalKey;
  final Widget child;

  const ShowCase({
    required this.globalKey,
    required this.child,
    required this.title,
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: globalKey,
      disableMovingAnimation: true,
      overlayColor: Theme.of(context).colorScheme.secondaryContainer,
      overlayOpacity: 1.0,
      targetBorderRadius: const BorderRadius.all(Radius.circular(20)),
      targetPadding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      container: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.displaySmall),
              TextButton(
                onPressed: () {
                },
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                  backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.background),
                  foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(desc),
                    const Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
