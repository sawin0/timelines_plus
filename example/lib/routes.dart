// GoRouter configuration
import 'package:example/showcase/package_delivery_tracking.dart';
import 'package:example/showcase/process_timeline.dart';
import 'package:example/showcase/timeline_status.dart';
import 'package:example/theme_page.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/theme',
      builder: (context, state) => const ThemePage(),
    ),
    GoRoute(
      path: '/timeline_status',
      builder: (context, state) => const TimelineStatusPage(),
    ),
    GoRoute(
      path: '/package_delivery_tracking',
      builder: (context, state) => const PackageDeliveryTrackingPage(),
    ),
    GoRoute(
      path: '/process_timeline',
      builder: (context, state) => const ProcessTimelinePage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const ExamplePage(),
    ),
  ],
);
