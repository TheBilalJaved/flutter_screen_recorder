import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_screen_recorder_method_channel.dart';

abstract class FlutterScreenRecorderPlatform extends PlatformInterface {
  /// Constructs a FlutterScreenRecorderPlatform.
  FlutterScreenRecorderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterScreenRecorderPlatform _instance = MethodChannelFlutterScreenRecorder();

  /// The default instance of [FlutterScreenRecorderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterScreenRecorder].
  static FlutterScreenRecorderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterScreenRecorderPlatform] when
  /// they register themselves.
  static set instance(FlutterScreenRecorderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
