import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_screen_recorder_platform_interface.dart';

/// An implementation of [FlutterScreenRecorderPlatform] that uses method channels.
class MethodChannelFlutterScreenRecorder extends FlutterScreenRecorderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_screen_recorder');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
