package dev.andyng.dailymind

import android.content.Context
import com.ryanheise.audioservice.AudioServicePlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity:FlutterActivity() {
  @Override
  final public override fun provideFlutterEngine(context: Context): FlutterEngine {
    return AudioServicePlugin.getFlutterEngine(context)
  }
}
