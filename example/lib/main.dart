import 'package:example/showcase/vertical_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'component_page.dart';
import 'routes.dart';
import 'showcase/package_delivery_tracking.dart';
import 'showcase/process_timeline.dart';
import 'showcase/timeline_status.dart';
import 'showcase_page.dart';
import 'theme_page.dart';
import 'widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Timelines Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // onGenerateRoute: (settings) {
      //   String? path = Uri.tryParse(settings.name!)?.path;
      //   Widget child;
      //   switch (path) {
      //     case '/theme':
      //       child = const ThemePage();
      //       break;
      //     case '/timeline_status':
      //       child = const TimelineStatusPage();
      //       break;
      //     case '/package_delivery_tracking':
      //       child = const PackageDeliveryTrackingPage();
      //       break;
      //     case '/process_timeline':
      //       child = const ProcessTimelinePage();
      //       break;
      //     case '/':
      //       child = const ExamplePage();
      //       break;
      //     default:
      //       child = const ExamplePage();
      //   }
      //
      //   return MaterialPageRoute(builder: (context) => HomePage(child: child));
      // },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () async {
        if (_navigatorKey.currentState?.canPop() ?? false) {
          _navigatorKey.currentState?.maybePop();
          return false;
        } else {
          return true;
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => widget.child,
              ),
            ),
          ),
          if (kIsWeb) const WebAlert()
        ],
      ),
    );
  }
}

class WebAlert extends StatelessWidget {
  const WebAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80.0,
      child: Material(
        child: Center(
          child: Text(
            'You are using the web version now.\nSome UI can be broken.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineTheme(
      data: TimelineThemeData(
        indicatorTheme: const IndicatorThemeData(size: 15.0),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Timelines Example'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            _NavigationCard(
              name: 'Components',
              navigationBuilder: () => const ComponentPage(),
            ),
            _NavigationCard(
              name: 'Timeline Status',
              navigationBuilder: () => const TimelineStatusPage(),
            ),
            _NavigationCard(
              name: 'Package Delivery Tracking',
              navigationBuilder: () => const PackageDeliveryTrackingPage(),
            ),
            _NavigationCard(
              name: 'Process Timeline',
              navigationBuilder: () => const ProcessTimelinePage(),
            ),
            _NavigationCard(
              name: 'Theme',
              navigationBuilder: () => const ThemePage(),
            ),
            _NavigationCard(
              name: 'Showcase',
              navigationBuilder: () => const ShowcasePage(),
            ),
            _NavigationCard(
              name: 'Showcase',
              navigationBuilder: () => const VerticalTimelinePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  const _NavigationCard({
    required this.name,
    this.navigationBuilder,
  });

  final String name;
  final NavigateWidgetBuilder? navigationBuilder;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NavigationCard(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        borderRadius: BorderRadius.circular(8),
        navigationBuilder: navigationBuilder,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Text(name),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
