
import 'flutter_screen_recorder_platform_interface.dart';
import 'package:flutter/services.dart';

class FlutterScreenRecorder {
  Future<String?> getPlatformVersion() {
    return FlutterScreenRecorderPlatform.instance.getPlatformVersion();
  }
    static const MethodChannel _channel = MethodChannel('flutter_screen_recorder');

  static Future<String> startRecording() async {
    final String result = await _channel.invokeMethod('startRecording');
    return result;
  }

  static Future<String> stopRecording() async {
    final String result = await _channel.invokeMethod('stopRecording');
    return result;
  }
}
