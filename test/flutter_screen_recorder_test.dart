import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screen_recorder/flutter_screen_recorder.dart';
import 'package:flutter_screen_recorder/flutter_screen_recorder_platform_interface.dart';
import 'package:flutter_screen_recorder/flutter_screen_recorder_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterScreenRecorderPlatform
    with MockPlatformInterfaceMixin
    implements FlutterScreenRecorderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterScreenRecorderPlatform initialPlatform = FlutterScreenRecorderPlatform.instance;

  test('$MethodChannelFlutterScreenRecorder is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterScreenRecorder>());
  });

  test('getPlatformVersion', () async {
    FlutterScreenRecorder flutterScreenRecorderPlugin = FlutterScreenRecorder();
    MockFlutterScreenRecorderPlatform fakePlatform = MockFlutterScreenRecorderPlatform();
    FlutterScreenRecorderPlatform.instance = fakePlatform;

    expect(await flutterScreenRecorderPlugin.getPlatformVersion(), '42');
  });
}
