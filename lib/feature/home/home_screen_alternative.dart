import 'package:chrconnecthpdraft/feature/home/components/appointments/appointments.dart';
import 'package:chrconnecthpdraft/feature/home/components/inbox/inbox.dart';
import 'package:chrconnecthpdraft/feature/home/components/more_resources.dart';
import 'package:chrconnecthpdraft/feature/home/components/welcoming.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../widgets/showcase/showcase.dart';
import 'components/reminders/reminders.dart';

class HomeScreenAlternative extends StatelessWidget {
  final GlobalKey one;
  final GlobalKey two;
  final GlobalKey three;
  final GlobalKey four;
  final GlobalKey five;
  final GlobalKey six;
  final ScrollController scrollController;

  const HomeScreenAlternative({
    Key? key,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('images/background.png'),
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              ShowCase(
                globalKey: one,
                title: "We'll take you on a quick tour of your home page",
                desc: "Continue",
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Welcoming(
                    state: WelcomingStates.evening,
                    name: "Linda",
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ShowCase(
                globalKey: two,
                title: "The first section shows your reminders. If there are any task requiring action from you, you'll find them here",
                desc: "Scroll to the next section",
                child: const Reminders(),
              ),
              const SizedBox(height: 32),
              ShowCase(
                  globalKey: three,
                  title: "This second section gives you easy access to upcoming appointments",
                  desc: "Continue",
                  child: Appointments(four: four, five: five)),
              const SizedBox(height: 32),
              ShowCase(
                globalKey: six,
                title: "At the bottom of the page, you'll find your messages and some extra resources",
                desc: "Continue",
                child: Column(
                  children: const [
                    Inbox(),
                    SizedBox(height: 32),
                    MoreResources(),
                    SizedBox(height: 88),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
