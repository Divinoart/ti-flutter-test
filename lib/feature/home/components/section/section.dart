import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';

import '../../../widgets/showcase/showcase.dart';

class Section extends StatelessWidget {
  const Section({
    Key? key,
    this.name,
    this.child,
    this.showViewAll = false,
    this.globalKey,
  }) : super(key: key);

  final String? name;
  final Widget? child;
  final bool showViewAll;
  final GlobalKey? globalKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  name!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                if (showViewAll && globalKey != null)
                  ShowCase(
                    globalKey: globalKey!,
                    title: "You can view your appointments via this link",
                    desc: "Continue",
                    child: Text(
                      context.localizations.view_all,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                if (showViewAll && globalKey == null)
                  Text(
                    context.localizations.view_all,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        if (child != null && name != null) const SizedBox(height: 16),
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
