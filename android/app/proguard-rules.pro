# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.plugin.editing.** { *; }

# easy_localization / shared_preferences
-keep class androidx.lifecycle.** { *; }
-keep class androidx.datastore.** { *; }

# Keep shared_preferences Android implementation
-keep class com.google.android.** { *; }

# Keep all classes used by reflection
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception

# Prevent stripping of plugin registrant
-keep class ** implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }
-keep class ** implements io.flutter.plugin.common.PluginRegistry$PluginRegistrantCallback { *; }
