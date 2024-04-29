import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:chrconnecthpdraft/feature/home/components/calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/showcase/showcase.dart';

class AppointmentsItem extends StatelessWidget {
  const AppointmentsItem({
    Key? key,
    required this.date,
    required this.image,
    this.duration = Duration.zero,
    this.title = '',
    this.subtitle = '',
    this.place = '',
    this.cta = '',
    this.calendarSize = const Size(64, 64),
    this.imageRadius = 12,
    this.condensed = false,
    this.globalKey,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final DateTime date;
  final Duration duration;
  final String place;
  final String cta;
  final ImageProvider image;
  final double imageRadius;
  final Size calendarSize;
  final bool condensed;
  final GlobalKey? globalKey;

  @override
  Widget build(BuildContext context) =>
      condensed ? _buildCondensed(context) : _buildNonCondensed(context);

  Widget _buildCondensed(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Calendar(
                size: calendarSize,
                month: DateFormat.MMM().format(date).toString(),
                day: DateFormat.d().format(date).toString(),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: image,
                        maxRadius: imageRadius,
                        minRadius: imageRadius,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.outline),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
          Divider(
            height: 28,
            thickness: 1,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.25),
          ),
          //const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Image.asset('images/schedule-20.png'),
              const SizedBox(width: 16),
              Expanded(
                child: Wrap(
                  children: [
                    Text(
                      '${DateFormat.jm().format(date)} ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      '(${duration.inMinutes} min)',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  cta,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildNonCondensed(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Calendar(
                size: calendarSize,
                month: DateFormat.MMM().format(date).toString(),
                day: DateFormat.d().format(date).toString(),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: image,
                        maxRadius: imageRadius,
                        minRadius: imageRadius,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.outline),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            thickness: 1,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.25),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Image.asset('images/schedule-20.png'),
              const SizedBox(width: 16),
              Text.rich(TextSpan(
                text: '${DateFormat.yMMMd().format(date)},',
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                    text: ' ${DateFormat.jm().format(date)} ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: '(${duration.inMinutes} min)',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Image.asset('images/hospital.png'),
              const SizedBox(width: 16),
              Text(place),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                context.localizations.confirmed,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
              const Spacer(),
              if (globalKey != null)...[
                ShowCase(
                  globalKey: globalKey!,
                  title: "There are direct links to your virtual appointments.",
                  desc: "Continue",
                  child: TextButton(
                    onPressed: () {},
                    child: Text(cta),
                  ),
                ),
              ] else ...[
                TextButton(
                  onPressed: () {},
                  child: Text(cta),
                ),
              ],
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
