import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class VerticalTimelinePage extends StatelessWidget {
  const VerticalTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Centered Vertical Timeline")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
              ),
              Expanded(
                child: Timeline.tileBuilder(
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.alternating,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text('Timeline Event $index'),
                    ),
                    itemCount: 10, // Number of timeline events
                  ),
                ),
              ),
              Container(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
