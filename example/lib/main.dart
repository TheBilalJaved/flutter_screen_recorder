import 'package:flutter/material.dart';
import 'package:flutter_screen_recorder/flutter_screen_recorder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Recorder Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Screen Recorder Example'),
        ),
        body: const ScreenRecorderWidget(),
      ),
    );
  }
}

class ScreenRecorderWidget extends StatefulWidget {
  const ScreenRecorderWidget({super.key});

  @override
  State<ScreenRecorderWidget> createState() => _ScreenRecorderWidgetState();
}

class _ScreenRecorderWidgetState extends State<ScreenRecorderWidget> {
  String _status = "Ready to Record";

  void _startRecording() async {
    final result = await FlutterScreenRecorder.startRecording();
    setState(() {
      _status = result;
    });
  }

  void _stopRecording() async {
    final result = await FlutterScreenRecorder.stopRecording();
    setState(() {
      _status = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_status),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startRecording,
                child: const Text("Start Recording"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _stopRecording,
                child: const Text("Stop Recording"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
